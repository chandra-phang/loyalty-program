class CreateYearlyPeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :yearly_periods do |t|
      t.string :name
      t.integer :year
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end

    add_index :yearly_periods, :year, unique: true
  end
end
