class EliminarEstatusHabitacion < ActiveRecord::Migration[5.2]
  def change
    remove_column :habitacions, :status_habitacion
  end
end
