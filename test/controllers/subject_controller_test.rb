require 'test_helper'

class SubjectControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subject_index_url
    assert_response :success
  end

  test "should get edit" do
    get subject_edit_url
    assert_response :success
  end

  test "should get new" do
    get subject_new_url
    assert_response :success
  end

  test "should get create" do
    get subject_create_url
    assert_response :success
  end

  test "should get delete" do
    get subject_delete_url
    assert_response :success
  end

  test "should get destroy" do
    get subject_destroy_url
    assert_response :success
  end

end
