#CONTROLADOR DESECHADO -> REEMPLAZADO POR USUER (CREADO CON DEVISE)
=begin
class ClientesController < ApplicationController
  #GET /clientes
  def index
    datos
    @clientes = Cliente.all
  end
  #GET /clientes/:id
  def show
    datos
    @clientes = Cliente.find(params[:id])
  end

  #GET /clientes
  def new
    datos
    @clientes = Cliente.new
  end
  #POST /clientes
  def create
    @clientes = Cliente.new(rutCliente: params[:cliente][:rutCliente],
                        nombresCliente: params[:cliente][:nombresCliente],
                          emailCliente: params[:cliente][:emailCliente],
                      fechaNacimiento: params[:cliente][:fechaNacimiento],
                              nickName: params[:cliente][:nickName],
                     contraseñaCliente: params[:cliente][:contraseñaCliente],
                      direccionCliente: params[:cliente][:direccionCliente])
    @clientes.save
    redirect_to @clientes
  end

  def destroy

  end

  #PUT /cliente/:id
  def update

  end

  def edit

  end

end
=end
