require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end
  
  test 'show' do
    get :show, id: 1
    assert_response :success
    assert_instance_of Project, assigns(:project)
  end
  
  test 'not signed in' do
    get :new
    assert_response :redirect
    
    post :create
    assert_response :redirect
    
    get :edit
    assert_response :redirect
    
    put :update
    assert_response :redirect
  end
  
  test 'signed in' do
    login_with_facebook
    
    get :new
    assert_response :success
  end

end