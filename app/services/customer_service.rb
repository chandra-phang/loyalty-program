# frozen_string_literal: true

class CustomerService
  def list_customers
    Customer.includes(:tier).recently_updated
  end

  def find_or_create_customer(customer_ref, name)
    customer = Customer.find_by(customer_ref: customer_ref)
    if customer
      customer.name = name
    else
      customer ||= Customer.create_customer(customer_ref, name)
    end

    customer
  end

  def calibrate_customer_tier(customer, period = Period.current_period)
    # calculate customer's spend amount of current period
    spend_amount = customer.calculate_spend_amount_by_period(period)
    customer.spend_amount = spend_amount

    # determine customer's tier based on spend amount
    current_tier = Tier.find_by_spend_amount(spend_amount)
    customer.tier_id = current_tier.id

    # determine customer's next tier and amount_to_reach_next_tier
    next_tier = current_tier.find_next_tier
    if next_tier
      customer.next_tier = next_tier.name
      customer.amount_to_reach_next_tier = next_tier.bottom_threshold - customer.spend_amount
    else
      customer.next_tier = "-"
      customer.amount_to_reach_next_tier = 0
    end

    # determine customer's next_period_tier
    next_period_spend_amount = customer.calculate_spend_amount_by_period(period.next_period)
    customer.next_period_tier = Tier.find_by_spend_amount(next_period_spend_amount).name

    # calculate amount_required_to_maintain_tier
    if next_period_spend_amount < current_tier.bottom_threshold
      customer.amount_required_to_maintain_tier = current_tier.bottom_threshold - next_period_spend_amount
    end

    customer
  end
end
