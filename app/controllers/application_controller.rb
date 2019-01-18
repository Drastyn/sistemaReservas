class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :danger, :info, :success, :warning

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :dar_de_baja, :guardar_habitacion, :mensaje_no_se_puede_eliminar, :mensaje_no_se_puede_editar, :mensaje_se_edito_habitacion,
  :mensaje_usuario_editado_con_exito, :mensaje_usuario_con_error

  def reserva_editada_con_exito
    flash[:success] = "Reserva editada con exito"
  end

  def habitacion_creada_con_exito
    flash[:success] = "Habitación creada con exito"
  end

  def habitacion_editada_con_exito
    flash[:success] = "Habitación editada con exito"
  end

  def mensaje_usuario_inactivo
      flash[:danger] = "Tu cuenta esta desactivada ponte en contacto con nuestro soporte al correo (agregar el correo de soporte cuando tengamos)"
  end

  def mensaje_usuario_con_error
    redirect_to users_path, danger: "No se ha editado el usuario"
  end

  def mensaje_usuario_editado_con_exito
    redirect_to users_path, success: "Se a editado el usuario con exito"
  end
  def mensaje_se_edito_habitacion
    flash[:danger] = "Recuerda que si vas a camibar el numero de la habitacion debes notificar al cliente que la tiene reservada"
  end
  def mensaje_no_se_puede_editar
   flash[:danger] = "No se puede editar una habitacion reservada, fijate que ya haya caducado la fecha de salida antes de realizar cualquier cambio"
  end
  def mensaje_no_se_puede_eliminar
    redirect_to edit_habitacion_url, danger: "No se puede eliminar una habitacion reservada"
  end
  #esconde la habitacion reservada en el index de habitaciones
  def guardar_habitacion
    @reserva = Reserva.last
    @habitaciones = Habitacion.all
    @habitaciones.each do |habitacion|
      if user_signed_in? && current_user.user?
        if @reserva.habitacions_id == habitacion.id
          if habitacion.disponible? && habitacion.activa?
            @reserva.habitacion_numero = habitacion.numero_habitacion
            habitacion.estado_habitacion = 1
            habitacion.save
            @reserva.save
            redirect_to reservas_path ,  success: "Reserva realizada con exito"
          else
            @reserva.delete
            redirect_to reservas_path ,  danger: "No se ha realizado la reserva, esa habitacion ya esta reservada o puede que ni siquiera exista"
          end
        end
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
