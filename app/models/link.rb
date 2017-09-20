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
  validates :base_url, presence: true
end
