class ApplicationController < ActionController::Base

  def login!(user)
    session[:session_token] = user.resest_session_token!
  end

end
