class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart = load_cart
  end

  def add
    @product = Product.find(params[:product_id])
    @cart = load_cart

    line_item = @cart.line_items.find_or_initialize_by(product: @product)
    line_item.quantity ||= 0
    line_item.quantity += 1
    line_item.save

    redirect_to cart_path, notice: 'Product added to cart!'
  end

  def update_quantity
    @cart = load_cart
    line_item = @cart.line_items.find(params[:line_item_id])
    new_quantity = params[:quantity].to_i

    if new_quantity > 0
      line_item.update(quantity: new_quantity)
      flash[:notice] = 'Quantity updated successfully.'
    else
      line_item.destroy
      flash[:notice] = 'Product removed from cart.'
    end

    redirect_to cart_path
  end

  def remove
    @cart = load_cart
    line_item = @cart.line_items.find(params[:line_item_id])

    line_item.destroy
    flash[:notice] = 'Product removed from cart.'

    redirect_to cart_path
  end

  def destroy
    @cart = load_cart
    @cart.destroy
    session[:cart_id] = nil

    flash[:notice] = 'Cart cleared successfully.'
    redirect_to root_path
  end

  private

  def set_cart
    @cart = load_cart
  end

  def load_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
