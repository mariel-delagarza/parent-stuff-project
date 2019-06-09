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

  test "successful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Good Boy"
    email = "goodboy@dog.com"
    patch user_path(@user), params: { user: { name: name, 
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user 
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end 

end
