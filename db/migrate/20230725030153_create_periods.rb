class CreatePeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :periods do |t|
      t.string :name
      t.integer :year
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end

    add_index :periods, :year, unique: true
  end
end
