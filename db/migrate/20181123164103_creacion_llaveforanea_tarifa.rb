class CreacionLlaveforaneaTarifa < ActiveRecord::Migration[5.2]
  def change
     add_foreign_key:habitacions, :tarifas, column: :tarifa_id, primary_key: :id
  end
end
