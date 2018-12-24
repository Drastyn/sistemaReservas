class RemoverEstadoHabitacionTarifaId < ActiveRecord::Migration[5.2]
  #se remeve estadoHabitacion (boolean) y tarifa_id(mal colocado)
  def change
    remove_column :habitacions, :estadoHabitacion
    remove_column :habitacions, :tarifa_id
  end
end
