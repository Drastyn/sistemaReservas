class ModificacionLlavefdehabitacionEnReserva < ActiveRecord::Migration[5.2]
  def change
    add_column :reservas, :habitacion_id, :integer
  end
end
