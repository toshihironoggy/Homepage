require 'test_helper'

class MogisuppleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mogisupple_index_url
    assert_response :success
  end

  test "should get show" do
    get mogisupple_show_url
    assert_response :success
  end

end
