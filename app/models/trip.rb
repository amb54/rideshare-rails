class Trip < ApplicationRecord
  validates :driver_id, numericality: { only_integer: true, greater_than: 0 }
  validates :passenger_id, numericality: { only_integer: true, greater_than: 0 }
  belongs_to :driver
  belongs_to :passenger

end
