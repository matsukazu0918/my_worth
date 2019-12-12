require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get reviews_edit_url
    assert_response :success
  end

end
