require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  
  fixtures :all
  
  test "sign in" do
    login_with_facebook
    assert_not_nil current_user
  end
  
  # test "the truth" do
  #   assert true
  # end
end
