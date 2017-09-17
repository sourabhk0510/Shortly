# == Schema Information
#
# Table name: polls
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  status      :string
#  creator_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Poll < ApplicationRecord
   validates :title, presence: true
   validates :description, presence: true
end
