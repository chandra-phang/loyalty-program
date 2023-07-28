# == Schema Information
#
# Table name: tiers
#
#  id               :bigint           not null, primary key
#  name             :string
#  rank             :integer
#  bottom_threshold :float
#  upper_threshold  :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Tier, type: :model do
  describe 'associations' do
    it { should have_many(:customers) }
    it { should have_many(:customer_tier_histories) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:rank) }

    let(:tier) { Tier.new(name: 'Gold', rank: 1) }

    subject { tier }
    it { should validate_uniqueness_of(:rank) }

    it 'is valid with name and rank' do
      expect(tier).to be_valid
    end
  end
end
