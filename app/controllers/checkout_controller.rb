class CheckoutController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart

  def new
    @order = Order.new
    @customer_id = session[:customer_id]
    @cart_total = @cart.line_items.to_a.sum { |item| item.product.price * item.quantity }
   end      

   def create
    @order = Order.new(order_params)
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
end
