require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get change_role" do
    get users_change_role_url
    assert_response :success
  end

end
