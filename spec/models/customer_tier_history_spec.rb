# frozen_string_literal: true

# == Schema Information
#
# Table name: customer_tier_histories
#
#  id           :bigint           not null, primary key
#  customer_ref :string
#  period_id    :integer
#  tier_id      :integer
#  spend_amount :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe CustomerTierHistory, type: :model do
  describe 'associations' do
    it { should belong_to(:customer) }
    it { should belong_to(:period) }
    it { should belong_to(:tier) }
  end

  describe 'validations' do
    it { should validate_presence_of(:customer_ref) }
    it { should validate_presence_of(:period_id) }
    it { should validate_presence_of(:tier_id) }

    let!(:tier) { create(:tier) }
    let(:customer) { create(:customer) }
    let(:period) { create(:period) }

    it 'is valid with customer_ref, period_id and tier_id' do
      history = CustomerTierHistory.new(
        customer_ref: customer.customer_ref,
        period_id: period.id,
        tier_id: tier.id
      )

      expect(history).to be_valid
    end
  end
end
