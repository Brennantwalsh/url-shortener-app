class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
  end

  def create
    @link = Link.create(user_id: params[:user_id],
                        slug: params[:slug],
                        target_url: params[:target_url])

    flash[:success] = "link has been created"
    redirect_to '/links'
  end
end
