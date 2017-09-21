# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  base_url   :string           default(""), not null
#  short_url  :string           default(""), not null
#  clicks     :integer          default(0), not null
#  creator_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ApplicationRecord
  validates :base_url, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true
  validates :creator_id, presence: true
  belongs_to :user, foreign_key: "creator_id"

  def self.create_or_find_link(base_url, creator)
    if Link.where(base_url: base_url).any?
      Link.find_by_base_url!(base_url)
    else
      Link.create(base_url: base_url, short_url: SecureRandom.hex(4), creator_id: creator.id)
    end
  end

  def increase_clicks
    self.clicks = self.clicks + 1
    self.save
  end
end
