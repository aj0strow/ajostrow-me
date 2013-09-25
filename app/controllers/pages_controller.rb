class PagesController < ApplicationController
  
  def about
  end
  
  def experience
  end
  
  def contact
    @city = current_city
    @urls = SOCIAL_URLS.to_a.map{|tuple| [tuple.first.to_s.dasherize, tuple.last] }
  end
  
  private
  
    def current_city
      'montreal'
    end
  
end
