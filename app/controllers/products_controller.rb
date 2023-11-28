class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @cart = load_cart

    if @product.nil?
      redirect_to products_path, alert: 'Product not found.'
    end
  end

  private

  def load_cart
    cart_id = session[:cart_id]
    if cart_id
      Cart.find_by(id: cart_id) || Cart.new
    else
      Cart.new
    end
  end
end
