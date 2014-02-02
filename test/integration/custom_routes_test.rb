require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest

  test "that /sign_in route opens sign_in page" do 
    get "/sign_in"
    assert_response :success    
  end

  test "that /sign_out route opens sign_out" do
    delete '/sign_out'
    assert_response :redirect
    assert_redirected_to '/'
  end

  test 'that /register route opens registration page' do
    get '/register'
    assert_response :success
  end

end
