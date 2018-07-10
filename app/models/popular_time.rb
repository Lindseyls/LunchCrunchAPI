class PopularTime < ApplicationRecord
  belongs_to :restaurant

  validates :wait_time, presence: true
end
