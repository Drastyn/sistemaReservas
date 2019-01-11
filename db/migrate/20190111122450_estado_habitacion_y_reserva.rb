class EstadoHabitacionYReserva < ActiveRecord::Migration[5.2]
  def change
    add_column :habitacions, :status_habitacion, :integer , default: 0;
    add_column :reservas, :estado_reserva, :integer, default: 0; 
  end
end
