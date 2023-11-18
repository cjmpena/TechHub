class HomeController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.includes(:products)
  end
  def category_products
    @category = Category.find(params[:id])
    @products = @category.products
  end
  def search
    @categories = Category.all
    @keyword = params[:keyword]
    @category_id = params[:category_id]
    @products = Product.search(@keyword, @category_id)
  end
end
