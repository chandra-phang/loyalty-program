# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should belong_to(:customer) }
  end

  describe 'validations' do
    it { should validate_presence_of(:order_ref) }
    it { should validate_presence_of(:customer_ref) }
    it { should validate_presence_of(:total_in_cents) }
    it { should validate_presence_of(:date) }

    let!(:tier) { create(:tier) }
    let!(:customer) { create(:customer) }
    let(:order) { create(:order, customer_ref: customer.customer_ref) }

    it 'is valid with order_ref, customer_ref, total_in_cents and date' do
      expect(order).to be_valid
    end
  end
end
