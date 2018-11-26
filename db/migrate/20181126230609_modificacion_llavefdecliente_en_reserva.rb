class ModificacionLlavefdeclienteEnReserva < ActiveRecord::Migration[5.2]
  def change
    add_column :reservas, :cliente_id, :integer
  end
end
