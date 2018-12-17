class RemoveForeingKeyClientesOfReservas < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reservas, :clientes, index:true, foreing_key: true
  end
end
