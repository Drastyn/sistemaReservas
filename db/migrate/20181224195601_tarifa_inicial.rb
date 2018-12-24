class TarifaInicial < ActiveRecord::Migration[5.2]
  def change
    change_column :habitacions, :tarifa_habitacion, :integer, default: 0;
  end
end
