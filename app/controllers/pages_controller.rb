class PagesController < ApplicationController
  
  def about
  end
  
  def projects
    
  end
  
  def contact
    @city = current_city
    @urls = SOCIAL_URLS
  end
  
  private
  
    def current_city
      ['seattle', 'montreal'].first
    end
  
end
