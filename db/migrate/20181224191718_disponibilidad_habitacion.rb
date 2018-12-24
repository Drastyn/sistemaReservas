class DisponibilidadHabitacion < ActiveRecord::Migration[5.2]
  #la habitacion esta disponible si su estado es true.
  def change
    change_column :habitacions, :estadoHabitacion, :boolean, default: true;
  end
end
