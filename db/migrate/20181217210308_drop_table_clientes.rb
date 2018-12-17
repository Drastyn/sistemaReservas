class DropTableClientes < ActiveRecord::Migration[5.2]
  def change
    drop_table :clientes
    #aprovecho esta migracion para eliminar el campo cliente_id
    remove_column :reservas, :cliente_id
    #tambien habitacion id
    remove_column :reservas, :habitacion_id
  end
end
