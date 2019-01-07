class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :dar_de_baja, :guardar_habitacion

  def guardar_habitacion
    @reserva = Reserva.last
    @habitaciones = Habitacion.all
    @habitaciones.each do |habitacion|
      if @reserva.habitacions_id == habitacion.id
        habitacion.estado_habitacion = 1
        habitacion.save
      end
    end
  end

  def dar_de_baja
    @usuario = current_user
    @usuario.estado_user = 1
    @usuario.save
    sign_out_and_redirect(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :nombres_apellidos, :nick_name, :direccion, :fecha_nacimiento, :telefono)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :nick_name, :telefono, :direccion, :password, :current_password)}
  end

  #permite acceso solo a los administradores
  def authenticate_admin!
    unless current_user.present? && current_user.admin?
      redirect_to root_path
    end
  end
end
