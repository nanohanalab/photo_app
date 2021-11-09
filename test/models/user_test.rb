require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(uid: "test_user",
      password: "pass", password_confirmation: "pass")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.uid = ""
    assert_not @user.valid?
  end
end