class ReviewsController < ProductsController
  before_action :require_login

  def create
    product = Product.find_by(id: params[:product_id])
    @review = product.reviews.new(
      description: params[:product][:review][:description],
      rating: params[:product][:review][:rating]
    )
    @review.user = current_user

    if @review.save
      redirect_to "/products/#{params[:product_id]}"
    else
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to "/products/#{params[:product_id]}"
  end


  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/login'
    end
  end

end
