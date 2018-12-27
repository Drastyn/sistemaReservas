class ReservasController < ApplicationController
  #GET /reservas
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
    @reservas = Reserva.new(fechaIngreso: params[:reserva][:fechaIngreso],
                            fechaSalida: params[:reserva][:fechaSalida],
                            cantidadPersonas: params[:reserva][:cantidadPersonas],
                            cantidadHabitaciones: params[:reserva][:cantidadHabitaciones],
                            estadoReserva: params[:reserva][:estadoReserva],
                            precioReserva: params[:reserva][:precioReserva])
    if @reservas.save
      redirect_to @reservas
    else
      render :new
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