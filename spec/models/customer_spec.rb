# frozen_string_literal: true

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
require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it { should belong_to(:tier) }
    it { should have_many(:orders) }
    it { should have_many(:customer_tier_histories) }
  end

  describe 'validations' do
    it { should validate_presence_of(:customer_ref) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:tier_id) }

    let(:tier) { Tier.create!(name: 'Bronze', rank: 3) }

    subject { Customer.new(name: 'John', customer_ref: 'C001', tier_id: tier.id) }
    it { should validate_uniqueness_of(:customer_ref) }

    it 'is valid with customer_ref, name and tier_id' do
      customer = Customer.new(name: 'John', customer_ref: 'C001', tier_id: tier.id)
      expect(customer).to be_valid
    end

    it 'is invalid without a name' do
      customer = Customer.new(customer_ref: 'C001', tier_id: tier.id)
      expect(customer).to_not be_valid
    end

    it 'is invalid without a customer_ref' do
      customer = Customer.new(name: 'John', tier_id: tier.id)
      expect(customer).to_not be_valid
    end

    it 'is invalid without a tier_id' do
      customer = Customer.new(name: 'John', tier_id: tier.id)
      expect(customer).to_not be_valid
    end
  end
end
