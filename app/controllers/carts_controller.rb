class CartsController < ApplicationController
    before_action :load_cart, only: [:show, :add]
  
    def show
        @cart = Cart.find(params[:id])
        @products = @cart.products
    end
  
    def add
        @product = Product.find(params[:product_id])
        @cart = load_cart
    
        line_item = @cart.line_items.build(product: @product)
        line_item.save
    
        redirect_to cart_path(@cart), notice: 'Product added to cart!'
      end
  
    private
  
    def load_cart
      @cart = if session[:cart_id]
                Cart.find_by(id: session[:cart_id]) || Cart.new
              else
                Cart.new
              end
    end
  end
  