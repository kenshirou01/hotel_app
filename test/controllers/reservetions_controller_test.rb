require "test_helper"

class ReservetionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservetions_index_url
    assert_response :success
  end
end
