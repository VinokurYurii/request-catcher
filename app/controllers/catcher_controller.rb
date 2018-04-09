class CatcherController < ApplicationController
  def index
    # client = Request.new
    # client.query_string = 'abir'.reverse
    # client.method = 'GET'.reverse
    # client.remote_ip = '192.168.0.1'.reverse
    # client.scheme = 'th/fd'.reverse
    # client.save
    #
    # clientH = RequestHeader.new(request_id: client.id)
    # clientH.key = 'header1'
    # clientH.value = 'value for header1'
    # clientH.save
    # @clientH = RequestHeader.new.inspect
    # @clientP = RequestParam.new.inspect
    # @clientC = RequestCookie.new.inspect
    #<Request id: nil, query_string: nil, method: nil, remote_ip: nil, scheme: nil, created_at: nil>
    # render :json => clientH
    # render :json => {name: "John"}
  end
end
