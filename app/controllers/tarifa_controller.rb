class TarifaController < ApplicationController
  #GET /tarifa
  def index
    datos
    @tarifa = Tarifa.all
  end
  #GET /tarifa/:id
  def show
    datos
    @tarifa = Tarifa.find(params[:id])
  end

  #GET /tarifa
  def new
    datos
    @tarifa = Tarifa.new
  end
  #POST /tarifa
  def create
    @tarifa = Tarifa.new(preciotarifa: params[:tarifa][:preciotarifa])
    @tarifa.save
    redirect_to @tarifa
  end

  def destroy

  end

  #PUT /tarifa/:id
  def update

  end

  def edit

  end

end
