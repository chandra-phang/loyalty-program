require "test_helper"

class CompletedOrderControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get completed_order_create_url
    assert_response :success
  end
end
