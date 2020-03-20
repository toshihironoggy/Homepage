require 'test_helper'

class TestkaiEndControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get testkai_end_index_url
    assert_response :success
  end

  test "should get new" do
    get testkai_end_new_url
    assert_response :success
  end

  test "should get create" do
    get testkai_end_create_url
    assert_response :success
  end

end
