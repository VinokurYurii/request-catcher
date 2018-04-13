require 'test_helper'

class RequestParamTest < ActiveSupport::TestCase
  test "save empty request param object" do
    request_param = RequestParam.new
    assert_not request_param.save, 'Saving empty request param object'
  end

  test "save request param object without query string" do
    request_param = RequestParam.new
    request_param.key = 'some key'
    assert_not request_param.save, 'Saving request param object without query string'
  end

  test "save request object without method" do
    request_param = RequestParam.new
    request_param.request_id = 1997
    request_param.key = 'some key'
    assert_not request_param.save, 'Saving request param object without method'
  end

  test "save valid request param object" do
    request = Request.create(:query_string => 'some', :method => 'GET')

    request_param = RequestParam.new
    request_param.request_id = request.id
    request_param.key = 'some key'
    request_param.key = 'some value'
    assert request_param.save, 'Saving valid request param object'
  end
end