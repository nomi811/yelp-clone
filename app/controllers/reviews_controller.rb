class ReviewsController < ApplicationController
  #before_action :authenticate_user!, :except => [:index, :show]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # def create
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   if current_user.has_reviewed? @restaurant
  #     flash[:notice] = 'Sorry you have already reviewed'
  #     render 'new'
  #   else
  #     @restaurant.reviews.create(review_params)
  #     redirect_to '/restaurants'
  #   end
  # end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.build_with_user review_params, current_user

    if @review.save
      redirect_to restaurants_path
    else
      if @review.errors[:user]
      redirect_to restaurants_path, alert: 'You have already reviewed this restaurant'
    else
      render :new
    end
  end
end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
