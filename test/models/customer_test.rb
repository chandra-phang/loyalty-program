# == Schema Information
#
# Table name: customers
#
#  id                               :bigint           not null
#  customer_ref                     :string           not null, primary key
#  name                             :string           not null
#  tier_id                          :integer          not null
#  spend_amount                     :float            default(0.0)
#  next_tier                        :string
#  amount_to_reach_next_tier        :float            default(0.0)
#  next_period_tier                 :string
#  amount_required_to_maintain_tier :float            default(0.0)
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#
require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
