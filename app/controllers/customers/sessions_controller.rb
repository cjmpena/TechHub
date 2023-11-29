class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
 
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || session[:return_to] || root_path
  end
 
  # POST /resource/sign_in
  def create
    super do |resource|
      session[:customer_id] = resource.id
      puts session[:customer_id] # Add this line
    end
  end
 
  # DELETE /resource/sign_out
  # def destroy
  # super
  # end
 
  # protected
 
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  # devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
 end
 