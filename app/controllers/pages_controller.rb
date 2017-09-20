class PagesController < ApplicationController
  skip_authorization_check
  def home
    @link = Link.new
  end
end
