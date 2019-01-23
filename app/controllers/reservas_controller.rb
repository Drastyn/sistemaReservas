class ReservasController < ApplicationController
  #GET /reservas

  #permite el acceso solo a los usuarios (comunes)
  before_action :authenticate_admin!, except: [:index,:show,:new,:create]
  def index
    @reservas = Reserva.all
  end
  #GET /reservas/:id
  def show
    @reservas = Reserva.find(params[:id])
  end

  #GET /reservas
  def new
    @reservas = Reserva.new
  end
  #POST /clientes
  def create
    @reservas = Reserva.new(fecha_ingreso: params[:reserva][:fecha_ingreso],
                            fecha_salida: params[:reserva][:fecha_salida],
                            habitacions_id: params[:reserva][:habitacions_id],
                            estado_reserva: params[:reserva][:estado_reserva])
                            #cantidadPersonas: params[:reserva][:cantidadPersonas],
                            #cantidadHabitaciones: params[:reserva][:cantidadHabitaciones],
                            #estadoReserva: params[:reserva][:estadoReserva],
                            #precioReserva: params[:reserva][:precioReserva])
    if @reservas.save
      @reservas.estado_reserva = 0
      @reservas.users_id = current_user.id
      @reservas.save
      @id_habitacion = guardar_habitacion
    else
      render 'new'
    end
  end

  def destroy
    @reservas = Reserva.find(params[:id])
    @reservas.destroy #elimina el objeto de la BD
    redirect_to reservas_path
  end

  #PUT /reservas/:id
  def update
    @reservas = Reserva.find(params[:id])
    if @reservas.update(fecha_ingreso: params[:reserva][:fecha_ingreso],
                        fecha_salida: params[:reserva][:fecha_salida],
                        habitacions_id: params[:reserva][:habitacions_id],
                        estado_reserva: params[:reserva][:estado_reserva])
    end
    if @reservas.save
      @mensaje = reserva_editada_con_exito
      redirect_to reservas_path
    else
      render :edit
    end

  end

  def edit
    @reservas = Reserva.find(params[:id])
  end
end
