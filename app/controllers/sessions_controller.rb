class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if user
      login!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = ['Invalid Credentials']
      redirect_to new_session_url
    end
  end

  def destroy
    user = User.find(current_user.id)
    user.resest_session_token!
    session[:session_token] = nil

    redirect_to new_session_url
  end

end
