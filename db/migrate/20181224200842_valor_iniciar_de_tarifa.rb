class ValorIniciarDeTarifa < ActiveRecord::Migration[5.2]
  #tarifa por defecto, puede variar.
  def change
    change_column :habitacions, :tarifa_habitacion, :integer, default: 10000;
  end
end
