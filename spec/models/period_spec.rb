# frozen_string_literal: true

# == Schema Information
#
# Table name: periods
#
#  id         :bigint           not null, primary key
#  name       :string
#  year       :integer
#  start_at   :datetime
#  end_at     :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Period, type: :model do
  describe 'associations' do
    it { should have_many(:customer_tier_histories) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:start_at) }
    it { should validate_presence_of(:end_at) }

    it 'is valid with name, year, start_at, and end_at' do
      period = build(:period)
      expect(period).to be_valid
    end
  end
end
