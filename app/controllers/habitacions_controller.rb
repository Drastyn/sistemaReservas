class HabitacionsController < ApplicationController
  before_action :authenticate_admin!, except: [:index]#solo el administrador puede crear una habitacion (los usuarios comunes
  #ven solo ven las habitaciones disponibles)
  #GET /habitacions
  def index
    @habitacions = Habitacion.all
  end
  #GET /habitacions/:id
  def show
    #Encuentra un registro por id
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
                                        tarifa_habitacion: params[:habitacion][:tarifa_habitacion],
                                        estado_habitacion: params[:habitacion][:estado_habitacion])
    #validacion correcta de la creacion de la habitacion
    if @habitacions.save
      redirect_to :action => :index
    else
      render 'new'
    end
  end

  def destroy
    @habitacions = Habitacion.find(params[:id])
    @habitacions.destroy #elimina el objeto de la BD
    redirect_to habitacions_path
  end

  #PUT /habitacion/:id
  def update
    @habitacions = Habitacion.find(params[:id])
    if @habitacions.update(descripcionHabitacion: params[:habitacion][:descripcionHabitacion],
                           numeroPersonas: params[:habitacion][:numeroPersonas],
                           tipoHabitacion: params[:habitacion][:tipoHabitacion],
                           tarifa_habitacion: params[:habitacion][:tarifa_habitacion],
                           estado_habitacion: params[:habitacion][:estado_habitacion])
    else
      render :edit
    end
  end

  def edit
    @habitacions = Habitacion.find(params[:id])
  end


end
