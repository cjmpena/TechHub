class OrderConfirmationsController < ApplicationController
  def show
   @order = Order.find(params[:id])
  end
  def confirmation
    @order = Order.find(params[:id])
  end
 end
 