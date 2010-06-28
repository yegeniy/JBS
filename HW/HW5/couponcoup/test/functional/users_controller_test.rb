require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  fixtures :users
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

=begin
  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => { }
    end

    assert_redirected_to user_path(assigns(:user))
  end
=end

  test "should show user" do
    get :show, :id => users(:abraham).to_param
    assert_response :success
  end

=begin
# editing needs to pass validations
  test "should get edit" do
    puts users(:abraham).to_param
    get :edit, :id => users(:abraham).to_param
    assert_response :success
  end
=end

=begin
  test "should update user" do
    put :update, :id => users(:abraham).to_param, :user => { }
    assert_redirected_to user_path(assigns(:user))
  end
=end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:abraham).to_param
    end

    assert_redirected_to users_path
  end
end
