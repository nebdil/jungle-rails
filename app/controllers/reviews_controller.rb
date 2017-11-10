class ReviewsController < ProductsController
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
end
