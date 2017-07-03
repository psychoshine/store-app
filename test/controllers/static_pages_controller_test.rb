require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get main_page" do
    get static_pages_main_page_url
    assert_response :success
  end

end
