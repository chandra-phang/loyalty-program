# == Schema Information
#
# Table name: customer_tier_histories
#
#  id           :bigint           not null, primary key
#  customer_id  :integer
#  period_id    :integer
#  tier_id      :integer
#  spend_amount :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class CustomerTierHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
