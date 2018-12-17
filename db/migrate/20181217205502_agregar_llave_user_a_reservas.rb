class AgregarLlaveUserAReservas < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservas, :users, foreign_key: true
  end
end
