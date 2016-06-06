class WelcomeController < ApplicationController

  def show
    redirect_to thoughts_path if current_user
    # @current_user = current_user
  end

end
