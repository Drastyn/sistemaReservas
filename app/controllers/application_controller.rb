class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :dar_de_baja

  def dar_de_baja
    sign_out_and_redirect(current_user)
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :nombres_apellidos, :nombre_apellidos, :nick_name, :direccion, :fecha_nacimiento, :telefono)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end


  #permite acceso solo a los administradores
  def authenticate_admin!
    unless current_user.present? && current_user.admin?
      redirect_to root_path
    end
  end
end
