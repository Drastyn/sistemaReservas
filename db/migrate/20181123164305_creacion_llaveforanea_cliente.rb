class CreacionLlaveforaneaCliente < ActiveRecord::Migration[5.2]
  def change
     add_foreign_key :clientes, :reservas, column: :cliente_id, primary_key: :id
  end
end
