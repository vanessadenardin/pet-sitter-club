require "test_helper"

class ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get services_show_url
    assert_response :success
  end

  test "should get edit" do
    get services_edit_url
    assert_response :success
  end

  test "should get delete" do
    get services_delete_url
    assert_response :success
  end
end
