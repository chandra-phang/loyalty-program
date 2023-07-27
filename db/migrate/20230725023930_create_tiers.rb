class CreateTiers < ActiveRecord::Migration[7.0]
  def change
    create_table :tiers do |t|
      t.string :name
      t.integer :rank
      t.float :bottom_threshold
      t.float :upper_threshold

      t.timestamps
    end

    add_index :tiers, :rank
  end
end
