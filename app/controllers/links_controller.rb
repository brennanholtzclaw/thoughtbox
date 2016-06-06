class LinksController < ApplicationController
  before_action :unauthenticated_user

  def index
    @new_link = Link.new
    @links = current_user.links
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      current_user.links << @link
    else
      flash[:errors] = @link.errors.full_messages.join(", ")
    end
    redirect_to root_path
  end

  def update
     @link = Link.find(params[:id])
     @link.update_attributes(link_params)
     if @link.save
       redirect_to root_path
     else
       flash[:errors] = @link.errors.full_messages.join(", ")
       redirect_to root_path
     end
   end

   def edit
     @link = Link.find(params[:id])
   end

private
    def link_params
      params.require(:link).permit(:url, :title, :read)
    end
end
