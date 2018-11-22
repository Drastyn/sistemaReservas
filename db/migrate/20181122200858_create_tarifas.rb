class CreateTarifas < ActiveRecord::Migration[5.2]
  def change
    create_table :tarifas do |t|
      t.integer :preciotarifa

      t.timestamps
    end
  end
end
