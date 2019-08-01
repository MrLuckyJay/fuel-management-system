class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :productType
      t.integer :liters
      t.string :vehicleNumber
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
