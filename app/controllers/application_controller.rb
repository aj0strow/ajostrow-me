class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  
  helper_method :current_user
  
  private

    def current_user
      @current_user ||= session[:user]
    end

end
