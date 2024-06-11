require "test_helper"

class ExecutivesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get executives_index_url
    assert_response :success
  end
end
