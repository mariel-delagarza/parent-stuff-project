require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:waffles)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "", 
                                              email: "dog@badboy",
                                              password:              "bad",
                                              password_confirmation: "boy" } }
    assert_template 'users/edit'
  end 

end
