require 'test_helper'

class UsersEnrollTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:kelvin)
    @other_user = users(:erica)
  end

  test "enrolls" do
    log_in_as @user
    get root_path
    assert_template 'events/index'
  end
end
