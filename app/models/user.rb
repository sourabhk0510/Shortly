# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  email                      :string           default(""), not null
#  encrypted_password         :string           default(""), not null
#  reset_password_token       :string
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0), not null
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :inet
#  last_sign_in_ip            :inet
#  confirmation_token         :string
#  confirmed_at               :datetime
#  confirmation_sent_at       :datetime
#  unconfirmed_email          :string
#  failed_attempts            :integer          default(0), not null
#  unlock_token               :string
#  locked_at                  :datetime
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  role                       :string           default("guest")
#  guest_authentication_token :string
#

class User < ApplicationRecord
  extend Enumerize
  validates :role, presence: true
  enumerize :role, in: [:member, :admin, :guest], default: :guest, scope: true
  has_many :links
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
  before_validation :prepare_guest

  after_initialize do
    @raw_guest_authentication_token = nil
  end

  def self.build_guest(session)
    guest = User.new(role: 'guest')
    if session[:guest_authentication_token].present?
      guest.guest_authentication_token = Devise.token_generator.digest(self, :guest_authentication_token, session[:guest_authentication_token])
    else
      guest.generate_guest_authentication_token(session)
    end
    guest
  end

  def matches_guest_authentication_token?(guest_authentication_token)
    self.guest_authentication_token ==
    Devise.token_generator.digest(self.class, :guest_authentication_token, guest_authentication_token)
  end

  def self.find_by_guest_authentication_token(guest_authentication_token)
    original_token = guest_authentication_token
    guest_authentication_token = Devise.token_generator.digest(self, :guest_authentication_token, guest_authentication_token)

    where(guest_authentication_token: guest_authentication_token).first
  end

  def generate_guest_authentication_token(session)
    raw, enc = Devise.token_generator.generate(self.class, :guest_authentication_token)
    session[:guest_authentication_token] = raw
    self.guest_authentication_token = enc
  end

  protected

  def confirmation_required?
    false
  end

  def password_required?
    self.role == 'guest' ? false : super
  end

  def prepare_guest
    if self.role == 'guest'
      if self.email.blank?
        self.email = "guest_#{Time.zone.now.to_i}#{rand(100)}@guest.com"
        self.skip_confirmation!
      end
    end
  end 
end
