class UsersController < ApplicationController
  before_action :authenticate_admin!
  #GET /users
  def index
    @users = User.all
  end
  #GET /users/:id
  def show
    #Encuentra un registro por id
    @users = User.find(params[:id])
  end
  #GET /habitacion
  def new
    @users = User.new
  end
  #POST /habitacion
  def create
    @users = User.new(nombres_apellidos: params[:user][:nombres_apellidos],
                      nick_name: params[:user][:nick_name],
                      direccion: params[:user][:direccion],
                      telefono: params[:user][:telefono],
                      fecha_nacimiento: params[:user][:fecha_nacimiento],
                      email: params[:user][:email],
                      user_role: params[:user][:user_role],
                      estado_user: params[:user][:estado_user])
    if @users.save
      redirect_to user_path
    else
      render 'new'
    end
  end
  def destroy
    @users = User.find(params[:id])
    @users.destroy #elimina el objeto de la BD
    redirect_to user_path
  end
  def update
    @users = User.find(params[:id])
    if @users.update(nombres_apellidos: params[:user][:nombres_apellidos],
                     nick_name: params[:user][:nick_name],
                     direccion: params[:user][:direccion],
                     telefono: params[:user][:telefono],
                     fecha_nacimiento: params[:user][:fecha_nacimiento],
                     email: params[:user][:email],
                     user_role: params[:user][:user_role],
                     estado_user: params[:user][:estado_user])
      @exito = mensaje_usuario_editado_con_exito
    else
      @error = mensaje_usuario_con_error
    end

  end

  def edit
    @users = User.find(params[:id])
  end
end
