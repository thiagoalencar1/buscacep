# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.development?
  Rails.logger.info "Iniciando o processo de seeding..."

  cep_data = [
    { cep: '05424020', state: 'SP', city: 'São Paulo', district: 'Pinheiros', address: 'Rua Professor Carlos Reis', ddd: '11', count: 1 },
    { cep: '01001000', state: 'SP', city: 'São Paulo', district: 'Sé', address: 'Praça da Sé', ddd: '11', count: 3 },
    { cep: '20040003', state: 'RJ', city: 'Rio de Janeiro', district: 'Centro', address: 'Rua da Assembléia', ddd: '21', count: 3 },
    { cep: '30130003', state: 'MG', city: 'Belo Horizonte', district: 'Centro', address: 'Avenida Afonso Pena', ddd: '31', count: 3 },
    { cep: '40279435', state: 'BA', city: 'Salvador', district: 'Brotas', address: 'Rua Senador Theotônio Vilela', ddd: '71', count: 3 }
  ]

  cep_data.each do |data|
    unless CepLog.exists?(cep: data[:cep])
      CepLog.create!(data)
      puts "Registro criado para o CEP: #{data[:cep]}"
    else
      puts "Registro já existe para o CEP: #{data[:cep]}"
    end
  end

  Rails.logger.info "Processo de seeding concluído!"
end
