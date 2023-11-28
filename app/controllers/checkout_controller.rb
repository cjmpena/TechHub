class CheckoutController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer = current_customer
    @order.build_invoice(cart: @cart)
    @order.calculate_total

    if @order.save
      clear_cart
      redirect_to invoice_path(@order)
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
    params.require(:order).permit(:billing_address, :shipping_address, :payment_method)
  end

  def set_cart
    @cart = load_cart
  end

  def clear_cart

    session[:cart_id] = nil
  end
end
