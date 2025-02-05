class HomeController < ApplicationController
  def index
    @cep = params[:find_cep]
  end

  def find_cep
    @cep = params[:find_cep]
    return unless validate_cep(@cep)
    @address = get_address(@cep)
    render :index
  end

  private

  def validate_cep(cep)
    cep.gsub(/[\.\-]/, '').match?(/\A\d{8}\z/)
  end

  def get_address(cep)
    response = Faraday.get("https://cep.awesomeapi.com.br/json/#{cep}")

    JSON.parse(response.body).symbolize_keys
  end

  def cep_params
    params.require(:cep).permit(:find_cep)
  end
end
