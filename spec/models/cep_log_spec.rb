# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CepLog, type: :model do
  describe ".log" do
    context "when the CEP does not exist yet" do
      it "creates a new record" do
        address_data = {
          cep: '05424020',
          state: 'SP',
          city: 'São Paulo',
          district: 'Centro',
          address: 'Rua Professor Carlos Reis',
          ddd: '11'
        }

        expect {
          CepLog.log(address_data)
        }.to change { CepLog.count }.by(1)

        cep_log = CepLog.last
        expect(cep_log.cep).to eq('05424020')
        expect(cep_log.state).to eq('SP')
        expect(cep_log.city).to eq('São Paulo')
        expect(cep_log.district).to eq('Centro')
        expect(cep_log.address).to eq('Rua Professor Carlos Reis')
        expect(cep_log.ddd).to eq('11')
        expect(cep_log.count).to eq(1)
      end
    end

    context "when the CEP already exists" do
      it "increments the count" do
        address_data = {
          cep: '05424020',
          state: 'SP',
          city: 'São Paulo',
          district: 'Centro',
          address: 'Rua Professor Carlos Reis',
          ddd: '11'
        }

        CepLog.create!(address_data.merge(count: 1))

        expect {
          CepLog.log(address_data)
        }.to change { CepLog.find_by(cep: '05424020').count }.by(1)

        cep_log = CepLog.find_by(cep: '05424020')
        expect(cep_log.count).to eq(2)
      end
    end
  end
end
