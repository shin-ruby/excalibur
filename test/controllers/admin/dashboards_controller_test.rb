require 'test_helper'

class Admin::DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admin_root_url
    assert_response :success
  end

end
