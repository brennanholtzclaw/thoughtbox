class WelcomeController < ApplicationController

  def show
    redirect_to thoughts_index_path if current_user
    @current_user = current_user
  end

end
