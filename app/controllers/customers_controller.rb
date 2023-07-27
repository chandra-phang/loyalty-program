# frozen_string_literal: true

class CustomersController < ApplicationController
  def index
    @customers = service.list_customers.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @period = Period.current_period
  end

  private

  def service
    @service ||= CustomerService.new
  end
end
