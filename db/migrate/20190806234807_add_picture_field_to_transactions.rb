class AddPictureFieldToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :image, :string, default:'' 
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
