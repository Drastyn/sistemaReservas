class HabitacionsController < ApplicationController
  before_action :authenticate_admin!, except: [:index]#solo el administrador puede crear una habitacion (los usuarios comunes
  #ven solo ven las habitaciones disponibles)
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
                                        tarifa_habitacion: params[:habitacion][:tarifa_habitacion])
                                        #estadoHabitacion: params[:habitacion][:estadoHabitacion])
    #validacion correcta de la creacion de la habitacion
    if @habitacions.save
      redirect_to :action => :index
    else
      render 'new'
    end
  end

  def destroy

  end

  #PUT /habitacion/:id
  def update

  end

  def edit

  end

end
