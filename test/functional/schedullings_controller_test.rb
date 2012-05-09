require 'test_helper'

class SchedullingsControllerTest < ActionController::TestCase
  setup do
    @schedulling = schedullings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedullings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedulling" do
    assert_difference('Schedulling.count') do
      post :create, :schedulling => @schedulling.attributes
    end

    assert_redirected_to schedulling_path(assigns(:schedulling))
  end

  test "should show schedulling" do
    get :show, :id => @schedulling.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @schedulling.to_param
    assert_response :success
  end

  test "should update schedulling" do
    put :update, :id => @schedulling.to_param, :schedulling => @schedulling.attributes
    assert_redirected_to schedulling_path(assigns(:schedulling))
  end

  test "should destroy schedulling" do
    assert_difference('Schedulling.count', -1) do
      delete :destroy, :id => @schedulling.to_param
    end

    assert_redirected_to schedullings_path
  end
end
