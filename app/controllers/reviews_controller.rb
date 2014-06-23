class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      flash[:notice] = "Review saved!"
      redirect_to restaurant_path(@restaurant)
    else
      flash.now[:notice] = "Invalid input!  Please try again."
      render 'restaurants/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
