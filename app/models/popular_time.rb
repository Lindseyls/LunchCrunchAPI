class PopularTime < ApplicationRecord
  belongs_to :restaurant, {optional: true}

  validates :wait_time, presence: true
end
