class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :customer_ref
      t.string :name
      t.integer :tier_id, null: false
      t.float :spend_amount, default: 0
      t.string :next_tier
      t.float :amount_to_reach_next_tier, default: 0
      t.string :next_period_tier
      t.float :amount_required_to_maintain_tier, default: 0

      t.timestamps
    end

    add_index :customers, :customer_ref, unique: true
    add_foreign_key :customers, :tiers
  end
end
