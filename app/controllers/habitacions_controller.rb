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
                                        estado_habitacion: params[:habitacion][:estado_habitacion],
                                        numero_habitacion: params[:habitacion][:numero_habitacion],
                                        status_habitacion: params[:habitacion][:status_habitacion])
    #validacion correcta de la creacion de la habitacion
    if @habitacions.save
      redirect_to habitacions_path
    else
      render 'new'
    end
  end

  def destroy
    @habitacions = Habitacion.find(params[:id])
    if @habitacions.disponible?
      @reservas = Reserva.all
      @reservas.each do |reserva|
        #elimina la reserva si esta esta asociada a la habitacion
        if @habitacions.id == reserva.habitacions_id
          reserva.destroy
        end
      end
      @habitacions.destroy #elimina el objeto de la BD
      redirect_to habitacions_path
    else
      @mensaje = mensaje_no_se_puede_eliminar
    end
  end

  #PUT /habitacion/:id
  def update
    @habitacions = Habitacion.find(params[:id])
    if @habitacions.update(descripcionHabitacion: params[:habitacion][:descripcionHabitacion],
                           numeroPersonas: params[:habitacion][:numeroPersonas],
                           tipoHabitacion: params[:habitacion][:tipoHabitacion],
                           tarifa_habitacion: params[:habitacion][:tarifa_habitacion],
                           estado_habitacion: params[:habitacion][:estado_habitacion],
                           numero_habitacion: params[:habitacion][:numero_habitacion],
                           status_habitacion: params[:habitacion][:status_habitacion])
    end
    if @habitacions.save
      redirect_to habitacions_path
    else
      render :edit
    end
  end

  def edit
    @habitacions = Habitacion.find(params[:id])
  end


end
