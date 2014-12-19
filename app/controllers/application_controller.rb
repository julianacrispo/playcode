class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_location

  def is_admin?
    # current_user && current_user.role == "admin"
    current_user && current_user.admin?
  end
  helper_method :is_admin?

  def is_user?
    current_user
  end
  helper_method :is_user?

  def admin_required
    redirect_to products_path, flash: 'You need to be an admin for this' unless is_admin?
  end

  def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  return unless request.get? 
  if (request.path != "/users/sign_in" &&
      request.path != "/users/sign_up" &&
      request.path != "/users/password/new" &&
      request.path != "/users/password/edit" &&
      request.path != "/users/confirmation" &&
      request.path != "/users/sign_out" &&
      !request.xhr?) # don't store ajax calls
    session[:previous_url] = request.fullpath 
  end
end

##devise redirect after signin/out
def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end

   protected
 
   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :name
   end

end
