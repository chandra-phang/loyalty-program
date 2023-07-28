require 'rails_helper'

RSpec.describe "Customers", type: :request do

  before do
    create(:period)
    create(:period, :next_period)
  end

  let!(:bronze) { create(:tier) }
  let!(:silver) { create(:tier, :silver) }
  let!(:gold) { create(:tier, :gold) }
  let!(:customer) { create(:customer) }
  let(:valid_params) {
    # the default date here is 1 year ago, so we can test next_period case
    {
      customerId: customer.customer_ref,
      customerName: customer.name,
      orderId: "O-01",
      totalInCents: 1000,
      date: (Time.zone.now - 1.year).iso8601(3)
    }
  }

  describe "POST /orders/report" do
    context "when params is valid" do
      it "returns a successful response" do
        post '/orders/report', params: valid_params

        expected_body = {
          id: Order.last.id,
          order_ref: valid_params[:orderId],
          customer_ref: valid_params[:customerId],
          total_in_cents: valid_params[:totalInCents].to_f,
          date: valid_params[:date]
        }
        expect(response).to have_http_status(201)
        expect(response_body).to include(expected_body)
      end

      it "calibrate customer record correctly" do
        params = valid_params
        post '/orders/report', params: params

        expect(response).to have_http_status(201)

        customer.reload
        expect(customer.spend_amount).to eq(10)
        expect(customer.tier).to eq(bronze)
        expect(customer.next_tier).to eq(silver.name)
        expect(customer.amount_to_reach_next_tier).to eq(90)
        expect(customer.next_period_tier).to eq(bronze.name)
        expect(customer.amount_required_to_maintain_tier).to eq(0)

        second_params = valid_params
        second_params[:orderId] = "O-02"
        second_params[:totalInCents] = 9000
        second_params[:date] = Time.zone.now.iso8601
        post '/orders/report', params: second_params

        expect(response).to have_http_status(201)

        customer.reload
        expect(customer.spend_amount).to eq(100)
        expect(customer.tier).to eq(silver)
        expect(customer.next_tier).to eq(gold.name)
        expect(customer.amount_to_reach_next_tier).to eq(400)
        expect(customer.next_period_tier).to eq(bronze.name)
        expect(customer.amount_required_to_maintain_tier).to eq(10)
      end

      it "will update customer's name" do
        params = valid_params
        params[:customerName] = "New name"

        post '/orders/report', params: params
        expect(response).to have_http_status(201)

        customer.reload
        expect(customer.name).to eq(params[:customerName])
      end
    end

    context "when params is invalid" do
      it "returns an error when customerId is empty" do
        invalid_params = valid_params.except(:customerId)
        post '/orders/report', params: invalid_params

        expected_body = { errors: "Validation failed: Customer ref can't be blank" }
        expect(response).to have_http_status(422)
        expect(response_body).to eq(expected_body)
      end

      it "returns an error when customerName is empty" do
        invalid_params = valid_params.except(:customerName)
        post '/orders/report', params: invalid_params

        expected_body = { errors: "Validation failed: Name can't be blank" }
        expect(response).to have_http_status(422)
        expect(response_body).to eq(expected_body)
      end

      it "returns an error when orderId is empty" do
        invalid_params = valid_params.except(:orderId)
        post '/orders/report', params: invalid_params

        expected_body = { errors: "Validation failed: Order ref can't be blank" }
        expect(response).to have_http_status(422)
        expect(response_body).to eq(expected_body)
      end

      it "returns an error when totalInCents is empty" do
        invalid_params = valid_params.except(:totalInCents)
        post '/orders/report', params: invalid_params

        expected_body = { errors: "Validation failed: Total in cents can't be blank" }
        expect(response).to have_http_status(422)
        expect(response_body).to eq(expected_body)
      end

      it "returns an error when date is empty" do
        invalid_params = valid_params.except(:date)
        post '/orders/report', params: invalid_params

        expected_body = { errors: "Validation failed: Date can't be blank" }
        expect(response).to have_http_status(422)
        expect(response_body).to eq(expected_body)
      end
    end
  end

  describe "GET /customers/:id/orders" do
    it "returns a successful response" do
      post '/orders/report', params: valid_params
      expect(response).to have_http_status(201)

      get "/customers/#{customer.customer_ref}/orders"

      expect(response).to have_http_status(200)

      order = Order.last
      expect(response.body).to include(order.order_ref)
      expect(response.body).to include(format_datetime(order.date))
      expect(response.body).to include((order.total_in_cents / 100).to_s)
    end

    it "not returns error when orders is empty" do
      get "/customers/#{customer.customer_ref}/orders"

      expect(response).to have_http_status(200)
    end

    it "returns an error when customer_id is invalid" do
      get "/customers/invalid_id/orders"

      expected_body = { errors: "Couldn't find Customer with 'customer_ref'=invalid_id" }
      expect(response).to have_http_status(422)
      expect(response_body).to eq(expected_body)
    end
  end
end
