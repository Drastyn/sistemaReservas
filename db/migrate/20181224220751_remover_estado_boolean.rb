class RemoverEstadoBoolean < ActiveRecord::Migration[5.2]
  #remover estado usuario (booleano)
  def change
    remove_column :users, :estado
  end
end
