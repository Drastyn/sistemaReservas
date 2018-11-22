class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :rutCliente
      t.string :nombresCliente
      t.string :emailCliente
      t.datetime :fechaNacimiento
      t.string :nickName
      t.string :contraseñaCliente
      t.string :direccionCliente

      t.timestamps
    end
  end
end
