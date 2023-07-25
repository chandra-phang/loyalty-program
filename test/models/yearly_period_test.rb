# == Schema Information
#
# Table name: yearly_periods
#
#  id         :bigint           not null, primary key
#  name       :string
#  year       :integer
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class YearlyPeriodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
