class LinksController < ApplicationController
  before_action :unauthenticated_user

  def index
    # render text: "THOUGHTS FOUND HERE!"
  end

end
