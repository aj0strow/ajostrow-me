ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

OmniAuth.config.test_mode = true

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
  def login_with_facebook
    auth_hash = {
      'uid' => 'pjpa983fjpa9283fjpaow38f',
      'provider' => 'facebook',
      'info' => {
        'name' => 'Test User',
        'email' => 'testuser@test.com'
      }
    }
    get '/auth/facebook/callback', {}, { 'omniath.auth' => auth_hash }
  end
end