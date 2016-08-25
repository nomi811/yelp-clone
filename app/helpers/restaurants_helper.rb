require 'byebug'
module RestaurantsHelper
  def average_rating
    return 'N/A' if reviews.none?
    #byebug
    reviews.average(:rating)
  end
end
