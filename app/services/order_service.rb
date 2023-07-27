# frozen_string_literal: true

class OrderService
  def initialize
    @customer_service = CustomerService.new
  end

  def create_order(params)
    order = nil
    ActiveRecord::Base.transaction do
      # find or create customer based on customerId
      customer = @customer_service.find_or_create_customer(params[:customerId], params[:customerName])

      # create the order
      order = Order.create_order_record(params[:customerId], params[:orderId], params[:totalInCents], params[:date])

      # calibrate customer tier
      customer = @customer_service.calibrate_customer_tier(customer)

      customer.save!
    rescue StandardError => e
      raise e
    end

    order
  end

  def get_orders_by_period(customer, period)
    customer.orders
            .in_date_range(period.start_at, period.end_at)
            .order(:date, :order_ref)
            .limit(20)
  end
end
