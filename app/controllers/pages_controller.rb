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
      json = HTTParty.get 'https://www.google.com/latitude/apps/badge/api?user=4577041489618274709&type=json'
      if json
        json['features'].first['properties']['reverseGeocode'].split(',').first
      else
        'montreal'
      end
    end
  
end
