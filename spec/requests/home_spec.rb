require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /" do
    it "returns http success" do
      get root_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "#find_cep" do
    it "should find cep" do
      cep = '05424020'
  
      stub_request(:any, "https://cep.awesomeapi.com.br/json/#{cep}")
        .to_return(body: { address: 'Rua Professor Carlos Reis', city: 'São Paulo', state: 'SP' }.to_json)

      allow_any_instance_of(ActionController::Base).to receive(:protect_against_forgery?).and_return(false)

      post find_cep_path, params: { find_cep: "05424020"}

      expect(response).to have_http_status(:success)
      expect(response.body).to include("Rua Professor Carlos Reis")
      expect(response.body).to include("São Paulo")
      expect(response.body).to include("SP")
    end
  end
end
