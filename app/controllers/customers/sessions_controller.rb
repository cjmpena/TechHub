<<<<<<< HEAD:app/controllers/customers/sessions/sessions_controller.rb
# frozen_string_literal: true

<<<<<<< HEAD:app/controllers/customers/sessions_controller.rb
class Customers::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  
=======
class Customers::Sessions::SessionsController < Devise::SessionsController
=======
class Customers::SessionsController < Devise::SessionsController
>>>>>>> 683c8a7deaf4861093aefc6bbe1f5ce6a735eaf6:app/controllers/customers/sessions_controller.rb
  # before_action :configure_sign_in_params, only: [:create]
 
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || session[:return_to] || root_path
  end
<<<<<<< HEAD:app/controllers/customers/sessions/sessions_controller.rb

>>>>>>> cd38e71fdef9dd3f94917d1c5e89956cde3b524d:app/controllers/customers/sessions/sessions_controller.rb
  # GET /resource/sign_in
  def new
    super
  end

=======
 
  # GET /resource/sign_in
  # def new
  #  super
  # end
 
>>>>>>> 683c8a7deaf4861093aefc6bbe1f5ce6a735eaf6:app/controllers/customers/sessions_controller.rb
  # POST /resource/sign_in
  # def create
  #  super
  # end
 
  # DELETE /resource/sign_out
  # def destroy
  #  super
  # end
 
  # protected
 
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #  devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
 end
 