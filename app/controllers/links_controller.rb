class LinksController < ApplicationController

  def index

  end

  def create
    @link = Link.create_or_find_link(link_params[:base_url], current_user.id)
    respond_to do |format|
      format.js
    end
  end

  def go
    if Link.where(short_url: params[:in_url]).any?
      @link = Link.find_by_short_url!(params[:in_url])
      @link.increase_clicks
      redirect_to @link.base_url
    else
      redirect_to root_url
      flash[:error] = "No short url found.."
    end
  end

  private

  def link_params
    params.require(:link).permit(:base_url, :short_url)
  end
end
