class HabitacionsController < ApplicationController
  #GET /habitacions
  def index
    @habitacions = Habitacion.all
  end
  #GET /habitacions/:id
  def show
    @habitacions = Habitacion.find(params[:id])
  end

  #GET /habitacion
  def new
    @habitacions = Habitacion.new
  end
  #POST /habitacion
  def create
    @habitacions = Habitacion.new(descripcionHabitacion: params[:habitacion][:descripcionHabitacion],
                                        numeroPersonas: params[:habitacion][:numeroPersonas],
                                        tipoHabitacion: params[:habitacion][:tipoHabitacion],
                                        estadoHabitacion: params[:habitacion][:estadoHabitacion])
    @habitacions.save
    redirect_to @habitacions
  end

  def destroy

  end

  #PUT /habitacion/:id
  def update

  end

  def edit

  end

end
