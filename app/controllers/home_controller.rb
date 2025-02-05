class HomeController < ApplicationController
  def index
  end

  def find_cep
    @cep = params[:find_cep]
    @address = get_address(@cep)

    if get_address(@cep)[:code]
      @error = get_address(@cep)[:message]
    else
      @address = get_address(@cep)
      CepLog.log(@address)
    end

    render :index
  end

  private

  def get_address(cep)
    response ||= Faraday.get("https://cep.awesomeapi.com.br/json/#{cep}")

    JSON.parse(response.body).symbolize_keys
  end
end
