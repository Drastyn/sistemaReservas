class CreateAdministradors < ActiveRecord::Migration[5.2]
  def change
    create_table :administradors do |t|
      t.string :nombreAdministrador
      t.string :apellidosAdministrador
      t.string :rutAdministrador
      t.string :claveAnterior
      t.string :claveActual

      t.timestamps
    end
  end
end
