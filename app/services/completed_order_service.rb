# frozen_string_literal: true

class CompletedOrderService
  def create(params)
    spend_amount = params[:totalInCents].to_i / 100
    customer = Customer.find_by(customer_ref: params[:customerId])

    # find or create customer based on customerId
    if !customer
      customer = Customer.create(
        name: params[:customerName],
        customer_ref: params[:customerId],
        spend_amount: spend_amount
      )
    else
      customer.spend_amount += spend_amount
    end

    # create completed_order entity
    order = CompletedOrder.create(
      customer_ref: params[:customerId],
      order_ref: params[:orderId],
      total_in_cents: params[:totalInCents],
      date: params[:date]
    )

    # calculate customer spend amount of current period
    tier_service = TierService.new
    spend_amount = tier_service.calculate_customer_spend_amount(customer)
    customer.spend_amount = spend_amount

    # determine customer's tier based on spend amount
    tier = tier_service.find_tier_by_spend_amount(spend_amount)
    customer.tier_id = tier.id

    customer.save!

    order
  end
end
