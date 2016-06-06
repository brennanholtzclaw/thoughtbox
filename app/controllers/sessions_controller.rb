class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Logged in!"
      session[:user_id] = @user.id
      redirect_to thoughts_path
    else
      flash.now[:error] = "Your email or password is incorrect"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
