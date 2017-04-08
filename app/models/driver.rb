class Driver < ApplicationRecord
  validates :name, presence: true
  validates :vin, presence: true, length: {is: 17}
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

  def self.random_driver_id
    found = false
    until found
      id = Driver.all.collect {|t| t.id}.sample
      trips_ratings = Driver.find(id).trips.all.collect {|t| t.rating}
      if !(trips_ratings.include? nil)
        found = true
        return id
      end
    end
  end


end #End of class Driver
