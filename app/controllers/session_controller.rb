class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])

    # @user = User.find_by(username: params[:session][:username])
    # if @user && @user.authenticate(params[:session][:password])
    #   flash[:success] = "Logged in as #{@user.username}"
    #   session[:user_id] = @user.id
    #   if @user.admin?
    #     redirect_to admin_dashboard_index_path
    #   else
    #     redirect_to dashboard_path
    #   end
    # else
    #   flash.now[:danger] = "Invalid login details. Please try again."
    #   render :new
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
