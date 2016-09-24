class VisitsController < ApplicationController
  def create
    @link = Link.find_by(slug: params[:slug])

    if @link
      Visit.create(link_id: @link.id)
      redirect_to "#{@link.target_url}"
    else
      redirect_to '/'
    end
  end
end
