# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  base_url   :string           default(""), not null
#  short_url  :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ApplicationRecord
  validates :base_url, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true

  def self.create_or_find_link(base_url)
    if Link.where(base_url: base_url).any?
      Link.find_by_base_url!(base_url)
    else
      Link.create(base_url: base_url, short_url: SecureRandom.hex(4))
    end
  end
end
