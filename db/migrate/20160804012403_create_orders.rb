class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 7, scale: 2
      t.integer :quantity
      t.integer :product_id
      t.integer :user_id
      t.decimal :subtotal, precision: 7, scale: 2
      t.decimal :tax, precision: 7, scale: 2

      t.timestamps
    end
  end
end
