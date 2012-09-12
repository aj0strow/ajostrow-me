ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  def login_with_facebook
    get '/auth/facebook', controller: :sessions
  end
  
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = {
    'user_info' => { 'name' => 'Mario Brothers', 'image' => '', 'email' => 'dpsk@email.ru' },
    'uid' => '123545',
    'provider' => 'facebook',
    'credentials' => {'token' => 'token'}
  }


end
