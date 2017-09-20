class LinksController < ApplicationController
  
  def index
  end

  def create
    @link = Link.create(base_url: link_params[:base_url], short_url: SecureRandom.hex(4))
    respond_to do |format|
      format.js
    end
  end

  def destroy
  end

  private

  def link_params
    params.require(:link).permit(:base_url, :short_url)
  end
end
