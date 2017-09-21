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

class LinkTest < ActiveSupport::TestCase
  user = User.create(email: "demsssso@example.com", role: "admin", password: "123456", password_confirmation: "123456")
  test 'valid link' do
    link = Link.new(base_url: 'John ddgs doe', short_url: 'somthing else', creator_id: user.id)
    assert link.valid?
  end

  test 'invalid without base_url' do
    link = Link.new(base_url: nil, short_url: 'somthing else', creator_id: user.id)
    assert_not link.valid?
  end

  test 'invalid without short_url' do
    link = Link.new(base_url: "john fgd doe", short_url: nil, creator_id: user.id)
    assert_not link.valid?
  end

  test 'invalid without creator_id' do
    link = Link.new(base_url: "johnsdf doe", short_url: nil, creator_id: nil)
    assert_not link.valid?
  end

  test 'invalid link' do
    link = Link.new(base_url: nil, short_url: nil, creator_id: nil)
    assert_not link.valid?
  end
end
