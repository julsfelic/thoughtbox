class LinksController < ApplicationController
  before_action :authorized?, only: [:index]

  def index
    @link = Link.new
    @links = current_user.links.all
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      flash[:success] = 'Newely submitted link!'
      redirect_to links_path
    else
      flash.now[:error] = 'Invalid information provided'
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end

  def authorized?
    redirect_to root_path unless current_user
  end
end
