class OrdersController < ApplicationController
    before_action :authenticate_customer!

    def index
    @orders = current_user.orders
    end
    def create
        @order = Order.new(order_params)
        @order.customer_id = current_user.id
        @order.calculate_taxes
        if @order.save
          redirect_to order_confirmation_path(@order)
        else
          render :new
        end
    def order_params
    params.require(:order).permit(:address, :province_id, :customer_id, product_ids: [])
    end
end
end