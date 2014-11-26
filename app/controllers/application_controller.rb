class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?
 

  def is_admin?
    # current_user && current_user.role == "admin"
    current_user && current_user.admin?
  end
  helper_method :is_admin?


  def admin_required
    redirect_to products_path, flash: 'You need to be an admin for this' unless is_admin?
  end

   protected
 
   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :name
   end

end
