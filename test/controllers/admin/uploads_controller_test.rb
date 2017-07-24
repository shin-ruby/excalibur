require 'test_helper'

class Admin::UploadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_uploads_index_url
    assert_response :success
  end

end
