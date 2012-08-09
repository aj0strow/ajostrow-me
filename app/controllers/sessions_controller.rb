class SessionsController < ApplicationController
  def create
    session[:user] = request.env["omniauth.auth"]
    redirect_to root_url
  end

  def destroy
    session[:user] = nil
    redirect_to root_url
  end
end