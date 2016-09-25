class LinksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(user_id: current_user.id,
                        slug: params[:slug],
                        target_url: params[:target_url])

    flash[:success] = "link has been created"
    redirect_to '/links'
  end

  def show
    @link = Link.find(params[:id])
    unless @link.user_id == current_user.id
      redirect_to '/'
    end
  end

  def edit
    @link = Link.find(params[:id])
    unless current_user.id == @link.user_id
      redirect_to '/'
    end
  end

  def update
    @link = Link.find(params[:id])
    @link.update(slug: params[:slug],
                 target_url: params[:target_url])

    flash[:success] = "Slug slug slug"
    redirect_to "/links/#{@link.id}"
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:warning] = "It is now gone. Hope you're happy. Hope you're happy how you killed your dream forever"
    redirect_to '/links'
  end
end
