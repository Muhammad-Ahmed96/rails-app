class AddIsActiveToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :is_active, :boolean, default: false
  end
end
