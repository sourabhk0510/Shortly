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

require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
