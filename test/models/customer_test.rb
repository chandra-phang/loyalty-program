# == Schema Information
#
# Table name: customers
#
#  id                       :bigint           not null
#  customer_ref             :string           primary key
#  name                     :string
#  tier_id                  :integer          not null
#  spend_amount             :float
#  next_period_spend_amount :float
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
