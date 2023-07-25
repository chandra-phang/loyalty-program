class TierService
  def calculate_customer_spend_amount(customer)
    period = YearlyPeriod.find_by(year: Time.zone.now.year)
    raise ActiveModel::StrictValidationFailed, 'Period is not found' unless period

    orders = customer.completed_orders.where(
      'date >= ? AND date <= ?',
      period.start_date.beginning_of_day,
      period.end_date.end_of_day
    )

    orders.sum(:total_in_cents) / 100
  end

  def find_tier_by_spend_amount(spend_amount)
    tiers = Tier.where('bottom_threshold <= ? AND upper_threshold >= ?', spend_amount, spend_amount)
    raise ActiveModel::StrictValidationFailed, 'Tier is not found' if tiers.empty?

    tiers[0]
  end
end
