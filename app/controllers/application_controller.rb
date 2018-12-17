class ApplicationController < ActionController::Base
  def datos
    @face = 'https://www.facebook.com/hostelmyhouse/'
    @booking = 'https://www.booking.com/hotel/cl/my-house-hostel.es.html'
    @instagram = 'https://www.instagram.com/hostalmyhouse/'
    @direccion = 'Bellavista 115, 2580067 Viña del Mar, Chile'
    @fono = ' +569 6539 9542'
  end
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :nombres_apellidos, :nombre_apellidos, :nick_name, :direccion, :fecha_nacimiento, :telefono)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end
end
