class CreacionLlaveforaneaHabitacion < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key:reservas, :habitacions, column: :habitacion_id, primary_key: :id
  end
end
