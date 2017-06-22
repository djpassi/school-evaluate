class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  protect_from_forgery with: :exception


  def user_not_authorized
    flash[:alert] = "Access deniend"
    redirect_to (request.referrer || index_path)
  end
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def confirm_logged_in

    if current_user==nil
      flash[:notice] = "Please log in"
      redirect_to "/"
      return false
    else
      return true
    end
  end

  def confirm_admin
    if current_user.admin?
      return true
    else
      flash[:notice] = "Página no permitida"
      redirect_to "/"
      return false
    end
  end


  def after_sign_in_path_for(resource)
	index_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
