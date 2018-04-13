require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  test "save empty request object" do
    request = Request.new
    assert_not request.save, 'Saving empty request object'
  end

  test "save request object without query string" do
    request = Request.new
    request.method = 'GET'
    assert_not request.save, 'Saving request object without query string'
  end

  test "save request object without method" do
    request = Request.new
    request.query_string = 'some'
    assert_not request.save, 'Saving request object without method'
  end

  test "save valid request object" do
    request = Request.new
    request.query_string = 'some'
    request.method = 'GET'
    assert request.save, 'Saving valid request object'
  end
end