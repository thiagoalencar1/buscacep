require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /" do
    it "returns http success" do
      get root_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "#find_cep" do
    before(:each) do
      allow_any_instance_of(ActionController::Base).to receive(:protect_against_forgery?).and_return(false)
    end

    it "should find cep" do
      cep = '05424020'
  
      stub_request(:get, "https://cep.awesomeapi.com.br/json/#{cep}")
        .to_return(body: { address: 'Rua Professor Carlos Reis', city: 'São Paulo', state: 'SP' }.to_json)

      post find_cep_path, params: { find_cep: cep }

      expect(response).to have_http_status(:success)
      expect(response.body).to include("Rua Professor Carlos Reis")
      expect(response.body).to include("São Paulo")
      expect(response.body).to include("SP")
    end

    it "if cep is invalid" do
      cep = '12.234-99'
  
      stub_request(:get, "https://cep.awesomeapi.com.br/json/#{cep}")
        .to_return(body: {"code":"invalid","message":"CEP invalido, tente: 00000000"}.to_json)

      post find_cep_path, params: { find_cep: cep }
  
      expect(response).to have_http_status(:success)
      expect(response.body).to include("CEP invalido")
    end
  
    it "if cep contain invalid characters" do
      cep = '4342adf'
  
      stub_request(:get, "https://cep.awesomeapi.com.br/json/#{cep}")
        .to_return(body: {"code":"invalid","message":"CEP invalido, tente: 00000000"}.to_json)

      post find_cep_path, params: { find_cep: cep }
  
      expect(response).to have_http_status(:success)
      expect(response.body).to include("CEP invalido")
    end
  end
end
