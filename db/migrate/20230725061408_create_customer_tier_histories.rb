class CreateCustomerTierHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_tier_histories do |t|
      t.integer :customer_id
      t.integer :yearly_period_id
      t.integer :tier_id
      t.float :spend_amount

      t.timestamps
    end

    add_index :customer_tier_histories, [:customer_id, :yearly_period_id], name: :customer_period_index, unique: true

    add_foreign_key :customer_tier_histories, :customers
    add_foreign_key :customer_tier_histories, :yearly_periods
    add_foreign_key :customer_tier_histories, :tiers    
  end
end
