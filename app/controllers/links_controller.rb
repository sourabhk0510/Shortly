class LinksController < ApplicationController

  def index

  end

  def create
    @link = Link.create_or_find_link(link_params[:base_url])
    respond_to do |format|
      format.js
    end
  end

  def go
    @link = Link.find_by_short_url!(params[:in_url])
    redirect_to @link.base_url
  end

  private

  def link_params
    params.require(:link).permit(:base_url, :short_url)
  end
end
