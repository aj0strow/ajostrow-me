class PagesController < ApplicationController
  
  def about
  end
  
  
  def contact
    @urls = SOCIAL_URLS
  end
  
end
