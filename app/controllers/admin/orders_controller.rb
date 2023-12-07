class Admin::OrdersController < ApplicationController
    def index
      @orders = Order.all.includes(:products, :customer)
    end
  end
  