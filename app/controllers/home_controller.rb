class HomeController < ApplicationController
  def index
    @cep = params[:find_cep]
  end

  def find_cep
    @cep = params[:find_cep]
    response = Faraday.get("https://cep.awesomeapi.com.br/json/#{@cep}")
    @address = JSON.parse(response.body).symbolize_keys
    render :index
  end
end
