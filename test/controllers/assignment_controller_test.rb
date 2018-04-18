require 'test_helper'

class AssignmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assignment_index_url
    assert_response :success
  end

  test "should get new" do
    get assignment_new_url
    assert_response :success
  end

  test "should get show" do
    get assignment_show_url
    assert_response :success
  end

end
