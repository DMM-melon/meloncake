require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get customers_edit_url
    assert_response :success
  end

  test "should get bye" do
    get customers_bye_url
    assert_response :success
  end

  test "should get update" do
    get customers_update_url
    assert_response :success
  end

  test "should get update_dl" do
    get customers_update_dl_url
    assert_response :success
  end

end
