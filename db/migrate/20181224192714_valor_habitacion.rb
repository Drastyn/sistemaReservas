class ValorHabitacion < ActiveRecord::Migration[5.2]
  #cuando se crea la habitacion 0 (esta desocupada), 1(cuando esta ocupada)
  def change
    add_column :habitacions, :estado_habitacion, :integer, default:0;
  end
end
