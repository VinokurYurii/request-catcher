class CatcherController < ApplicationController
  protect_from_forgery prepend: false
  def index

    request_scheme = params[:scheme]
    request_method = request.method
    request_params = {}
    params.each do |key,value|
      unless  ["controller", "action", "path", "scheme"].include? key
        request_params[key] = value
      end
    end

    request_headers = {}
    request.headers.env.keys.each do |header_key|
      if header_key.match("^HTTP|^REQUEST|^SERVER|^QUERY|PATH")
        request_headers[header_key] = request.headers[header_key]
      end
    end

    request_cookies = {}
    request.cookies.each do |key, value|
      request_cookies[key] = value
    end

    client_request = Request.create(
        :query_string => params[:path],
        :method       => request_method,
        :remote_ip    => request.remote_ip,
        :scheme       => request_scheme)

    request_params.each do |key, value|
      RequestParam.create(
          request_id: client_request.id,
          key: key,
          value: value.to_s)
    end

    request_headers.each do |key, value|
      RequestHeader.create(
          request_id: client_request.id,
          key: key,
          value: value.to_s)
    end

    request_cookies.each do |key, value|
      RequestCookie.create(
          request_id: client_request.id,
          key: key,
          value: value.to_s)
    end

    if request_scheme == 'requests' && request_method.upcase == 'GET'
      @requests = getRequestData params[:path]
      return
    else
      render :status => 201, :json => {:status => 'success'}
    end
  end

  private

    def getRequestData(path)
      Request.where("query_string = ?", path)
          .left_outer_joins(:request_headers, :request_params, :request_cookies)
          .distinct
          .order('requests.id')
          .reverse_order
    end
end
