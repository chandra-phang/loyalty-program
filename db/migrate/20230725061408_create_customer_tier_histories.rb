class CreateCustomerTierHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_tier_histories do |t|
      t.string :customer_ref
      t.integer :period_id
      t.integer :tier_id
      t.float :spend_amount

      t.timestamps
    end

    add_index :customer_tier_histories, %i[customer_ref period_id], name: :customer_period_index, unique: true

    add_foreign_key :customer_tier_histories, :periods
    add_foreign_key :customer_tier_histories, :tiers
  end
end
