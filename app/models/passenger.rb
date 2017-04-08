class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :phone_num, presence: true, length: {minimum: 10}
  has_many :trips

  def average_rating
    array_of_ratings = trips.all.collect {|t| t.rating}.select(&:present?)
    if array_of_ratings != []
      avg = array_of_ratings.sum.to_f/array_of_ratings.length
      return avg.round(1)
    else
      return "-"
    end
  end

end
