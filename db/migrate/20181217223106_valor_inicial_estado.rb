class ValorInicialEstado < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :estado, :boolean, default: true
  end
end
