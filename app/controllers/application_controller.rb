class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  before_action :load_cart
  before_action :set_current_user
  helper_method :current_user
 
  def after_sign_in_path_for(resource)
  if resource.is_a?(AdminUser)
  admin_dashboard_path
  else
  products_path
  end
  end
 
  def after_sign_out_path_for(resource_or_scope)
  if resource_or_scope == :admin_user
  new_admin_user_session_path
  else
  new_customer_session_path
  end
  end
 
  private
 
  def set_cart
  @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
  @cart = Cart.create
  session[:cart_id] = @cart.id
  end
 
  def set_current_user
    @current_user = Customer.find(session[:customer_id]) if session[:customer_id]
   end   
 
  def current_user
  @current_user
  end
 
  def load_cart
  @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
  @cart = Cart.create
  session[:cart_id] = @cart.id
  end
 end
 