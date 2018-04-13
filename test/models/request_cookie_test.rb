require 'test_helper'

class RequestCookieTest < ActiveSupport::TestCase
  test "save empty request cookie object" do
    request_cookie = RequestCookie.new
    assert_not request_cookie.save, 'Saving empty request cookie object'
  end

  test "save request cookie object without query string" do
    request_cookie = RequestCookie.new
    request_cookie.key = 'some key'
    assert_not request_cookie.save, 'Saving request cookie object without query string'
  end

  test "save request cookie object without method" do
    request_cookie = RequestCookie.new
    request_cookie.request_id = 1999
    request_cookie.key = 'some key'
    assert_not request_cookie.save, 'Saving request cookie object without method'
  end

  test "save valid request cookie object" do
    request = Request.create(:query_string => 'some', :method => 'GET')

    request_cookie = RequestCookie.new
    request_cookie.request_id = request.id
    request_cookie.key = 'some key'
    request_cookie.key = 'some value'
    assert request_cookie.save, 'Saving valid request cookie object'
  end
end