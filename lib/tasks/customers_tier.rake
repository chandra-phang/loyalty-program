namespace :customers do
  desc 'Calibrate customers tier'
  task calibrate_tier: :environment do
    period = Period.current_period
    Customer.find_each do |customer|
      customer = service.calibrate_customer_tier(customer)
      customer.save
    end
    puts "Calibrate customers tier completed!"
  end

  desc 'Archieve customers tier by year'
  task :archieve_tier, [:year] => [:environment] do |_, args|
    period = Period.find_by!(year: args[:year])
    Customer.find_each do |customer|
      archieve_customer_tier(customer, period)
    end
    puts "Archieve customers tier completed!"
  end

  private

  def service
    @service ||= CustomerService.new
  end

  def archieve_customer_tier(customer, period)
    service = CustomerService.new
    customer = service.calibrate_customer_tier(customer, period)

    tier_history = CustomerTierHistory.find_or_initialize_by(
      period_id: period.id,
      customer_ref: customer.customer_ref
    )
    tier_history.spend_amount = customer.spend_amount
    tier_history.tier_id = customer.tier.id

    tier_history.save
  end
end
