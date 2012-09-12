class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  
  before_filter :save_location
  helper_method :current_user
  
  private

    def current_user
      @current_user ||= session[:user]
    end
    
    def save_location
      session[:previous_url] = session[:current_url]
      session[:current_url] = request.fullpath
    end

end
