class AgregarTarifaHabitacion < ActiveRecord::Migration[5.2]
  def change
    add_column :habitacions, :tarifa_habitacion, :integer
  end
end
