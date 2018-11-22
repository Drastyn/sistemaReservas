class CreateHabitacions < ActiveRecord::Migration[5.2]
  def change
    create_table :habitacions do |t|
      t.text :descripcionHabitacion
      t.integer :numeroPersonas
      t.string :tipoHabitacion
      t.boolean :estadoHabitacion

      t.timestamps
    end
  end
end
