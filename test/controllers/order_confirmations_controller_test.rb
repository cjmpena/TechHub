require "test_helper"

class OrderConfirmationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get order_confirmations_show_url
    assert_response :success
  end
end
