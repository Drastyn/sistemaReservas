class CreacionLlaveforaneaCliente < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservas, :clientes, foreign_key: true
  end
end

