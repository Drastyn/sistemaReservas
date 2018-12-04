class CreacionLlaveforaneaTarifa < ActiveRecord::Migration[5.2]
  def change
    add_reference :habitacions, :tarifas, foreign_key: true
  end
end
