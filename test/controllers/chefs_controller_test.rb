require 'test_helper'

class ChefsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get chefs_new_url
    assert_response :success
  end

  test "should get create" do
    get chefs_create_url
    assert_response :success
  end

  test "should get edit" do
    get chefs_edit_url
    assert_response :success
  end

  test "should get update" do
    get chefs_update_url
    assert_response :success
  end

  test "should get delete" do
    get chefs_delete_url
    assert_response :success
  end

end
