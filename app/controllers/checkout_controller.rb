class CheckoutController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart
  before_action :set_current_user
 
  def new
    @order = Order.new
    @customer_id = current_user.id if current_user
    @cart_total = @cart.line_items.to_a.sum { |item| item.product.price * item.quantity }
  end     
 
  def create
    @order = Order.new(order_params)

    # Set the province for the order
    @order.province = Province.find_by(id: params[:order][:province_id])

    # Associate products with the order
    @cart.products.each do |product|
      @order.products << product
    end

    # Calculate total and taxes
    @order.total = @cart.line_items.to_a.sum { |item| item.product.price * item.quantity }
    @order.calculate_taxes

    if @order.save
      clear_cart
      redirect_to order_confirmation_path(@order)
    else
      render :new
    end
  end
 
  def show
    @order = Order.find(params[:id])
    @invoice = @order.invoice
  end
 
  private
 
  def order_params
    params.require(:order).permit(:address, :province_id, :customer_id, :total)
  end     
 
  def set_cart
    @cart = load_cart
  end
 
  def clear_cart
    session[:cart_id] = nil
  end
 
  def set_current_user
    @current_user = Customer.find(session[:customer_id]) if session[:customer_id]
  end
 end
 