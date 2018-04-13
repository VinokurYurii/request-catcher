class RequestParam < ApplicationRecord
  belongs_to :request

  validates :request_id, presence: true
  validates :key, presence: true
end