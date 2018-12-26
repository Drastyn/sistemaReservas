class TarifasController < ApplicationController
end
=begin
  #GET /tarifa
  def index
    datos
    @tarifas = Tarifa.all
  end
  #GET /tarifa/:id
  def show
    datos
    @tarifas = Tarifa.find(params[:id])
  end

  #GET /tarifa
  def new
    datos
    @tarifas = Tarifa.new
  end
  #POST /tarifa
  def create
    @tarifas = Tarifa.new(preciotarifa: params[:tarifa][:preciotarifa])
    @tarifas.save
    redirect_to @tarifas
  end

  def destroy

  end

  #PUT /tarifa/:id
  def update

  end

  def edit

  end

end
=end
