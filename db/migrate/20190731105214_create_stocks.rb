class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :productType
      t.integer :liters
      t.integer :total
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
