require 'test_helper'

class TeacherControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get teacher_show_url
    assert_response :success
  end

end
