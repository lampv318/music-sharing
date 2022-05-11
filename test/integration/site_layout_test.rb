require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links when not login" do
    get root_path
    assert_template 'home/index'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", login_path
  end

  test "layout links when logined" do
    log_in_as(users(:michael))

    get root_path
    assert_template 'home/index'
    assert_select "a[href=?]", root_path
    assert_select "form[action=?]", logout_path
  end
end
