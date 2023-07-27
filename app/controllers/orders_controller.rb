# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @period = Period.current_period

    orders = service.get_orders_by_period(@customer, @period)
    @orders = orders.page(params[:page])
  end

  def new
    @order = Order.new
  end

  def create
    order = service.create_order(order_params)
    json_response(order)
  end

  private

  def service
    @service ||= OrderService.new
  end

  def order_params
    params.permit(:customerId, :customerName, :orderId, :totalInCents, :date)
  end
end
