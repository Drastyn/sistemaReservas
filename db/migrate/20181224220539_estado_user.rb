class EstadoUser < ActiveRecord::Migration[5.2]
  #estado activo (0), estado inactivo (1)
  def change
    add_column :users, :estado_user, :integer, default:0;
  end
end
