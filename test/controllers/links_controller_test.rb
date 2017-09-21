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
  user = User.create(email: "demsso@example.com", role: "admin", password: "123456", password_confirmation: "123456")
  link = Link.create(base_url: "http://googssle.com", short_url: "d7df7d", creator_id: user.id)

  test "should get #top" do
    get top_links_url 
    assert_response :success
  end

  test "should get #go" do
    get root_url, params: { in_url: d7df7d }
    assert_response :success
  end

  test "should get #create" do
    post links_url, params: { link: { base_url: "http://googsqle.com", short_url: "ds3fxt", creator_id: user.id }}
    assert_response :success
  end
end
