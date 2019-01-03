class NuevasFechasReservas < ActiveRecord::Migration[5.2]
  def change
    add_column :reservas, :fecha_ingreso, :date
    add_column :reservas, :fecha_salida,  :date
  end
end
