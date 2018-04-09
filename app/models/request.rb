class Request < ApplicationRecord
  has_many :request_param
  has_many :request_header
  has_many :request_cookie
end