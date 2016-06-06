class LinksController < ApplicationController
  before_action :authorized?, only: [:index]

  def index
  end

  private

  def authorized?
    redirect_to root_path unless current_user
  end
end
