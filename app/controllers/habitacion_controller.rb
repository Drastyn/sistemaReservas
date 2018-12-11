class HabitacionController < ApplicationController
  #GET /habitacion
  def index
    datos
    @habitacion = Habitacion.all
  end
  #GET /habitacion/:id
  def show
    datos
    @habitacion = Habitacion.find(params[:id])
  end

  #GET /habitacion
  def new
    datos
    @habitacion = Habitacion.new
  end
  #POST /habitacion
  def create
    @habitacion = Habitacion.new(descripcionHabitacion: params[:habitacion][:descripcionHabitacion], numeroPersonas: params[:habitacion][:numeroPersonas], tipoHabitacion: params[:habitacion][:tipoHabitacion], estadoHabitacion: params[:habitacion][:estadoHabitacion])
    @habitacion.save
    redirect_to @habitacion
  end

  def destroy

  end

  #PUT /habitacion/:id
  def update

  end

  def edit

  end

end
