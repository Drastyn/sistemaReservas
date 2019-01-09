class NumeroHabitacion < ActiveRecord::Migration[5.2]
  def change
    add_column :habitacions, :numero_habitacion , :integer
  end
end
