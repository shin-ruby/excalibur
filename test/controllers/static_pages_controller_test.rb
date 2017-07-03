require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get root_url
    assert_response :success
    assert_select "title", "Welcome | Excalibur CMS"
  end

end
