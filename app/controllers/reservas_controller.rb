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

  end

  #PUT /reservas/:id
  def update

  end

  def edit

  end

end
