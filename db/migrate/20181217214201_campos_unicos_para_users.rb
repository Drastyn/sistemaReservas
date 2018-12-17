class CamposUnicosParaUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :telefono, :string, unique: true
    change_column :users, :nick_name, :string, unique: true
    change_column :users, :email, :string, unique: true
  end
end
