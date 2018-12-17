class RemoverUserId < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservas, :user_id
  end
end
