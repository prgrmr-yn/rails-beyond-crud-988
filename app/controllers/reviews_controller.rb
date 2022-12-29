class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  before_action :set_review, only: %i[edit update]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, :unprocessable_entity
    end
  end

  def edit; end

  def update
    @review.update(review_params)
    redirect_to restaurant_path(@review.restaurant), notice: 'beautifully updated'
  end

  def destroy
    @review = Review.find(params[:id])
    redirect_to restaurant_path(@review.restaurant), status: :see_other if @review.destroy
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
