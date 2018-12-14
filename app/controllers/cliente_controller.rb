class ClienteController < ApplicationController
  #GET /cliente
  def index
    datos
    @cliente = Cliente.all
  end
  #GET /cliente/:id
  def show
    datos
    @cliente = Cliente.find(params[:id])
  end

  #GET /cliente
  def new
    datos
    @cliente = Cliente.new
  end
  #POST /cliente
  def create
    @cliente = Cliente.new(rutCliente: params[:cliente][:rutCliente], nombresCliente: params[:cliente][:nombresCliente], emailCliente: params[:cliente][:emailCliente], fechaNacimiento: params[:cliente][:fechaNacimiento], nickName: params[:cliente][:nickName], contraseñaCliente: params[:cliente][:contraseñaCliente], direccionCliente: params[:cliente][:direccionCliente])
    @cliente.save
    redirect_to @cliente
  end

  def destroy

  end

  #PUT /cliente/:id
  def update

  end

  def edit

  end

end