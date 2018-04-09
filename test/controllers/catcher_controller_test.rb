require 'test_helper'

class CatcherControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get catcher_index_url
    assert_response :success
  end

end
