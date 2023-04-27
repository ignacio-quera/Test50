class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user_name = current_user.name
    if @review.save
      redirect_to @product, notice: 'La reseña se creó exitosamente.'
    else
      render 'products/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @review.product
  end

  def show
  end

  private

  def review_params
    params.require(:review).permit(:user_name, :comment, :rating)
    #params.require(:review).permit(:rating, :comment)
  end
  
  def set_review
    @review = Review.find(params[:id])
  end
end