require 'rails_helper'

RSpec.describe "Customers", type: :request do

  before do
    create(:tier)
    create(:period)
  end

  let!(:customer) { create(:customer) }

  describe "GET /customers" do
    it "returns a successful response" do
      get '/customers'

      expect(response).to have_http_status(200)
      expect(response.body).to include(customer.customer_ref)
      expect(response.body).to include(customer.name)
      expect(response.body).to include(customer.tier.name)
    end

    it "not returns error when customers are empty" do
      customer.delete
      get '/customers'

      expect(response).to have_http_status(200)
      expect(response.body).not_to include(customer.customer_ref)
      expect(response.body).not_to include(customer.name)
      expect(response.body).not_to include(customer.tier.name)
    end
  end

  describe "GET /customers/:id" do
    it "returns a successful response" do
      get "/customers/#{customer.customer_ref}"

      expect(response).to have_http_status(200)
      expect(response.body).to include(customer.customer_ref)
      expect(response.body).to include(customer.name)
      expect(response.body).to include(customer.tier.name)
    end

    it "returns an error response when id is invalid" do
      get "/customers/invalid_id"

      expected_body = { errors: "Couldn't find Customer with 'customer_ref'=invalid_id" }
      expect(response).to have_http_status(422)
      expect(response_body).to eq(expected_body)
    end
  end
end
