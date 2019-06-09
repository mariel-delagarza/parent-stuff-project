require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "dog@invalid",
                                         password:              "not",         
                                         password_confirmation: "valid" } }
    end 
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Fake User",
                                         email: "dog@goodboy.com",
                                         password:              "goodboy",         
                                         password_confirmation: "goodboy" } }
    end                                     
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
  
end
