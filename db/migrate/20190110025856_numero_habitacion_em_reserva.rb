class NumeroHabitacionEmReserva < ActiveRecord::Migration[5.2]
  def change
    add_column :reservas, :habitacion_numero , :integer
  end
end
