class Request < ApplicationRecord
  has_many :request_params
  has_many :request_headers
  has_many :request_cookies, class_name: 'RequestCookie'
end