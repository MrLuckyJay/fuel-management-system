class AddAdminFunc < ActiveRecord::Migration[5.2]
  def change
    remove_column :stocks, :total
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :is_staff, :boolean, default: false
  end
end
