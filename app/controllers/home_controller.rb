class HomeController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.includes(:products)
  end
end
