require 'test_helper'

class SlideControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get slide_index_url
    assert_response :success
  end

end
