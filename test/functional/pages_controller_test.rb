require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  test 'about' do
    get :about
    assert_response 200
  end
  
  test 'experience' do
    get :experience
    assert_response 200
  end
  
  test 'contact' do
    get :contact
    assert_response 200
  end

end