class ReviewsController < ApplicationController
  load_and_authorize_resource

  # add new review for an order
  # contains pet sitter, client and order references
  def new
    @review = Review.new(
      order_id: params[:order_id],
      client_id: current_user.id,
      pet_sitter_id: params[:pet_sitter_id],
      date: Time.now
    )
    @pet_sitter = User.find(@review.pet_sitter_id)
    @client = User.find(@review.client_id)

    p @review
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to order_path(@review.order_id)
  end

  private

  def review_params
    params.require(:review).permit(:date, :rating, :review, :order_id, :pet_sitter_id, :client_id)
  end
end
