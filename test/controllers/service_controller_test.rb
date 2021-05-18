require "test_helper"

class ServiceControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get service_create_url
    assert_response :success
  end

  test "should get show" do
    get service_show_url
    assert_response :success
  end

  test "should get edit" do
    get service_edit_url
    assert_response :success
  end

  test "should get delete" do
    get service_delete_url
    assert_response :success
  end
end
