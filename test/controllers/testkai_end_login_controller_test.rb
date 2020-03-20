require 'test_helper'

class TestkaiEndLoginControllerTest < ActionDispatch::IntegrationTest
  test "should get login_form" do
    get testkai_end_login_login_form_url
    assert_response :success
  end

  test "should get login" do
    get testkai_end_login_login_url
    assert_response :success
  end

  test "should get logout" do
    get testkai_end_login_logout_url
    assert_response :success
  end

end
