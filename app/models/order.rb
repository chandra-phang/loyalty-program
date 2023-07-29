# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  order_ref      :string           not null
#  customer_ref   :string           not null
#  total_in_cents :float
#  date           :datetime         not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Order < ApplicationRecord
  paginates_per 10

  belongs_to :customer, foreign_key: 'customer_ref'

  validates :order_ref, :customer_ref, :total_in_cents, :date, presence: true

  scope :in_date_range, lambda { |start_at, end_at|
    where(arel_table[:date].between(start_at..end_at))
  }

  def self.create_order_record(customer_ref, order_id, total_in_cents, date)
    create!(
      customer_ref: customer_ref,
      order_ref: order_id,
      total_in_cents: total_in_cents,
      date: date
    )
  end
end
