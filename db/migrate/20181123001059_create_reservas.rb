class CreateReservas < ActiveRecord::Migration[5.2]
  def change
    create_table :reservas do |t|
      t.datetime :fechaIngreso
      t.datetime :fechaSalida
      t.integer :cantidadPersonas
      t.integer :cantidadHabitaciones
      t.string :estadoReserva
      t.integer :precioReserva

      t.timestamps
    end
  end
end
