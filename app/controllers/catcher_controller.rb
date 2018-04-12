class CatcherController < ApplicationController
  protect_from_forgery prepend: false

  def show
    @requests = getRequestData params[:path]
  end

  def catch_request

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

    params_objects = []
    request_params.each do |key, value|
      params_objects.push(RequestParam.create(
          request_id: client_request.id,
          key: key,
          value: value.to_s))
    end

    headers_objects = []
    request_headers.each do |key, value|
      headers_objects.push(RequestHeader.create(
          request_id: client_request.id,
          key: key,
          value: value.to_s))
    end

    cookies_objects = []
    request_cookies.each do |key, value|
      cookies_objects.push(RequestCookie.create(
          request_id: client_request.id,
          key: key,
          value: value.to_s))
    end

    ActionCable.server.broadcast "catcher_#{params[:path]}",
                                 :request => client_request,
                                 :requestHeaders => headers_objects,
                                 :requestCookies => cookies_objects,
                                 :requestParams => params_objects

    render :status => 201, :json => {:status => 'success'}
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
