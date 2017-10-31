class SessionsController < ApplicationController
  def new
  end

  def create
    @user = find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login(@user)
      #redirect_to something
    else
      flash[:errors] = ["Invalid login"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
