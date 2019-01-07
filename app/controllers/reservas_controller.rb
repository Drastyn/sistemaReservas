class ReservasController < ApplicationController
  #GET /reservas

  #permite el acceso solo a los usuarios (comunes)
  def authenticate_user!
    unless current_user.present? && current_user.user?
      redirect_to root_path
    end
  end

  before_action :authenticate_user!, except: [:index]
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
                            habitacions_id: params[:reserva][:habitacions_id])
                            #cantidadPersonas: params[:reserva][:cantidadPersonas],
                            #cantidadHabitaciones: params[:reserva][:cantidadHabitaciones],
                            #estadoReserva: params[:reserva][:estadoReserva],
                            #precioReserva: params[:reserva][:precioReserva])
    if @reservas.save
      @reservas.users_id = current_user.id
      @reservas.save
      redirect_to :action => :index
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
                        habitacions_id: params[:reserva][:habitacions_id])
    else
      render :edit
    end

  end

  def edit
    @habitacions = Habitacion.find(params[:id])
  end
end
