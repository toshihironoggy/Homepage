require 'test_helper'

class TestkaiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get testkai_index_url
    assert_response :success
  end

  test "should get new" do
    get testkai_new_url
    assert_response :success
  end

  test "should get create" do
    get testkai_create_url
    assert_response :success
  end

end
