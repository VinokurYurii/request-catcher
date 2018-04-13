class RequestCookie < ApplicationRecord
  belongs_to :request

  validates_associated :request
  validates :key, presence: true
end