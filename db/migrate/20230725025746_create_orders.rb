class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :order_ref, null: false
      t.string :customer_ref, null: false
      t.float :total_in_cents
      t.datetime :date, null: false

      t.timestamps
    end

    add_index :orders, :customer_ref
  end
end
