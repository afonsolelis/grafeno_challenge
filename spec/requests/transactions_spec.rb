require 'rails_helper'

RSpec.describe "/transactions", type: :request do

  let(:valid_attributes) {
    {
      "name":"Maria Neusa de Aparecida",
      "cpf": "00249908255",
      "state": "São Paulo",
      "value": 1234
    }
  }

  let(:invalid_attributes) {
    {
      "name":"Maria Neusa de Aparecida",
      "cpf": "97905796671",
      "state": "Sao Paulo",
      "value": 1234
    }
  }

  let(:valid_headers) {
    {content_type: "application/json"}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Transaction.create! valid_attributes
      get transactions_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      transaction = Transaction.create! valid_attributes
      get transaction_url(transaction), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Transaction" do
        expect {
          post transactions_url,
               params: { transaction: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Transaction, :count).by(1)
      end

      it "renders a JSON response with the new transaction" do
        post transactions_url,
             params: { transaction: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Transaction" do
        expect {
          post transactions_url,
               params: { transaction: invalid_attributes }, as: :json
        }.to change(Transaction, :count).by(0)
      end

      it "renders a JSON response with errors for the new transaction" do
        post transactions_url,
             params: { transaction: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
