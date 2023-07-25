class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :customer_ref
      t.string :name
      t.integer :tier_id, null: false
      t.float :spend_amount
      t.float :next_period_spend_amount

      t.timestamps
    end

    add_index :customers, :customer_ref, unique: true
    add_foreign_key :customers, :tiers
  end
end
