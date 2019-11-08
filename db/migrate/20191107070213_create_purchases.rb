class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :no_of_items, default: 1
      t.boolean :is_purchased, default: false
      t.boolean :is_in_wish, default: false

      t.timestamps
    end
  end
end
