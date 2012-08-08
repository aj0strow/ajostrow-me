class PagesController < ApplicationController
  
  def home
    @info = ENV['FACEBOOK_SECRET']
  end
  
end
