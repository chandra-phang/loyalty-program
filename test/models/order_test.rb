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
require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
