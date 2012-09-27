require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  test 'about' do
    get :about
    assert_response :success
  end
  
  test 'experience' do
    get :experience
    assert_response :success
  end
  
  test 'contact' do
    get :contact
    assert_response :success
    assert_not_nil assigns(:city)
    assert_not_nil assigns(:urls)
  end

end