class Request < ApplicationRecord
  has_many :request_params
  has_many :request_headers
  has_many :request_cookies, class_name: 'RequestCookie'

  validates :query_string, presence: true
  validates :method, presence: true
end