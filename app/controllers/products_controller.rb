class ProductsController < ApplicationController
    def show
    @product = Product.find(params[:id])
    @cart = session[:cart] || Cart.new
  
      if @product.nil?
        redirect_to products_path, alert: 'Product not found.'
      end
    end
  end
  