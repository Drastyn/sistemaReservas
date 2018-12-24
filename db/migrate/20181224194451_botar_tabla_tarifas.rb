class BotarTablaTarifas < ActiveRecord::Migration[5.2]
  def change
    drop_table :tarifas
  end
end
