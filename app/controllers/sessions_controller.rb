class SessionsController < ApplicationController
  def create
    session[:user] = request.env["omniauth.auth"]
    redirect_to previous_url
  end

  def destroy
    session[:user] = nil
    redirect_to previous_url
  end
  
  private
  
    def previous_url
      "#{ session[:previous_url] }#nav" || root_path
    end
end