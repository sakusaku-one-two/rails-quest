require "test_helper"

class ArtivlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artivles_index_url
    assert_response :success
  end

  test "should get show" do
    get artivles_show_url
    assert_response :success
  end

  test "should get update" do
    get artivles_update_url
    assert_response :success
  end

  test "should get create" do
    get artivles_create_url
    assert_response :success
  end
end
