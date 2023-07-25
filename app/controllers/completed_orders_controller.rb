# frozen_string_literal: true

class CompletedOrdersController < ApplicationController
  def create
    completed_order = service.create(order_params)
    json_response(completed_order)
  end

  def service
    @service ||= CompletedOrderService.new
  end

  def order_params
    params.permit(:customerId, :customerName, :orderId, :totalInCents, :date)
  end
end
