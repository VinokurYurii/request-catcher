require 'test_helper'

class CatcherControllerTest < ActionDispatch::IntegrationTest

  def initialize params
    super(params)
    @request_methods = [:get, :post, :put, :delete]
    @query_strings = ['qweasd', '1234', '123asd321']
  end

  test "Sending methods for catch empty request" do
    @request_methods.each do |method|
      @query_strings.each do |query_string|
        self.send method, catch_empty_request_url( :path => query_string, :scheme => 'nil')
        assert_response :success, "Send #{method} for catch_empty_request_url with query string: #{query_string}"
      end
    end
  end

  test "Sending methods for catch request with some scheme" do
    @request_methods.each do |method|
      @query_strings.each do |query_string|
        @query_strings.each do |scheme|
          self.send method, catch_request_url( :path => query_string, :scheme => scheme)
          assert_response :success,
                          "Send #{method} for catch_empty_request_url with query string: #{query_string} and scheme: #{scheme}"
        end
      end
    end
  end

  test "should get index" do
    get home_url
    assert_response :success, "Should get index"
  end

  test "should get show_request_data" do
    get show_request_data_url :path => 'some'
    assert_response :success, "Should get show_request_data"
  end
end
