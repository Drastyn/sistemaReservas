class RemoverForeingKeyTarifa < ActiveRecord::Migration[5.2]
  def change
    remove_reference :habitacions, :tarifas, index: true, foreing_key: true
  end
end
