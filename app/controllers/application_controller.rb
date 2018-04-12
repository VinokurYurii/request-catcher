class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    @base_url = request.base_url
  end
end
