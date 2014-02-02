require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
    @user = users(:alisa)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should get redirected when not signed in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test 'should render the new status page when signed in' do
    sign_in users(:alisa)
    get :new
    assert_response :success
  end

  test 'should be logged in to post a status' do
    post :create, status: { content: 'Hello' }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create status when logged in" do
    sign_in users(:alisa)
    assert_difference('Status.count') do
      post :create, status: { content: @status.content }
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should be redirected from update when not signed in" do
    put :update, id: @status, status: { content: 'Hello' }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update status" do
    sign_in @user
    put :update, id: @status, status: { content: @status.content }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should redirect from edit when not signed in" do
    get :edit, id: @status
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit when signed in" do
    sign_in @user
    get :edit, id: @status
    assert_response :success
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
