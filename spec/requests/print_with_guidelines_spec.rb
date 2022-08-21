require 'rails_helper'

RSpec.describe "/print_with_guidelines", type: :request do
  let(:valid_attributes) {
    {
      "name":"Maria Neusa de Aparecida",
      "cpf": "00249908255",
      "state": "São Paulo",
      "value": 1234
    }
  }
  
  let(:valid_headers) {
    {content_type: "application/json"}
  }

  it "renders a successful response" do
    Transaction.create! valid_attributes
    get print_with_guidelines_url, headers: valid_headers, as: :json
    expect(response).to be_successful
  end
end
