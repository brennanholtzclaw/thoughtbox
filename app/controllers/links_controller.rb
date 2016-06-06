class LinksController < ApplicationController
  before_action :unauthenticated_user

  def index
    @new_link = Link.new
    @links = current_user.links
  end


end
