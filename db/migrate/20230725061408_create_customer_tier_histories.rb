class CreateCustomerTierHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_tier_histories do |t|
      t.integer :customer_id
      t.integer :period_id
      t.integer :tier_id
      t.float :spend_amount

      t.timestamps
    end

    add_index :customer_tier_histories, %i[customer_id period_id], name: :customer_period_index, unique: true

    add_foreign_key :customer_tier_histories, :customers
    add_foreign_key :customer_tier_histories, :periods
    add_foreign_key :customer_tier_histories, :tiers
  end
end
