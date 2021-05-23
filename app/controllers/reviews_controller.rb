class ReviewsController < ApplicationController
  
  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to @review
  end

  private

  def review_params
    params.require(:review).permit(:name, :email, :rating; :review, :pet_sitter_id, :client_id)
  end
end
