class ModificacionLlavefdetarifaEnHabitacion < ActiveRecord::Migration[5.2]
  def change
    add_column :habitacions, :tarifa_id, :integer
  end
end
