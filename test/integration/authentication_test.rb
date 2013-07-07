require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
    
  test "sign in" do
    login_with_facebook
    get '/'
    assert_not_nil assigns(:current_user)
  end
 
end
