require 'test_helper'

class RequestHeaderTest < ActiveSupport::TestCase
  test "save empty request header object" do
    request_header = RequestHeader.new
    assert_not request_header.save, 'Saving empty request header object'
  end

  test "save request header object without query string" do
    request_header = RequestHeader.new
    request_header.key = 'some key'
    assert_not request_header.save, 'Saving request header object without query string'
  end

  test "save request object without method" do
    request_header = RequestHeader.new
    request_header.request_id = 1998
    request_header.key = 'some key'
    assert_not request_header.save, 'Saving request header object without method'
  end

  test "save valid request header object" do
    request = Request.create(:query_string => 'some', :method => 'GET')

    request_header = RequestHeader.new
    request_header.request_id = request.id
    request_header.key = 'some key'
    request_header.key = 'some value'
    assert request_header.save, 'Saving valid request header object'
  end
end