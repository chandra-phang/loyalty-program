# == Schema Information
#
# Table name: tiers
#
#  id               :bigint           not null, primary key
#  name             :string
#  rank             :integer
#  bottom_threshold :float
#  upper_threshold  :float
#  image_url        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class TierTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
