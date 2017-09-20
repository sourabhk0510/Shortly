class PagesController < ApplicationController
  def home
    @link = Link.new
  end
end
