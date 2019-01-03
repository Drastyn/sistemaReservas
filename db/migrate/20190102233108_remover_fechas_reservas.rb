class RemoverFechasReservas < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservas, :fechaIngreso
    remove_column :reservas, :fechaSalida
  end
end
