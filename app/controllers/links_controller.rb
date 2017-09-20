class LinksController < ApplicationController
  def index
    
  end

  def new
    
  end

  def create
    
  end

  def destroy
    
  end

  private

  def link_params
    params.require(:link).permit(:base_url, :short_url)
  end
end
