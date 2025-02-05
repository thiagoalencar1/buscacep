class CepLog < ApplicationRecord
  validates :cep, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :district, presence: true
  validates :address, presence: true
  validates :ddd, presence: true

  scope :top_five, -> { order(count: :desc).limit(5) }
  scope :top_five_by_state, -> {
    select('DISTINCT ON (state) *')
      .order('state, count DESC')
      .limit(5)
  }

  def self.log(address)
    cep_record = find_by(cep: address[:cep])

    if cep_record.nil?
      cep_record = CepLog.new(
        cep: address[:cep],
        state: address[:state],
        city: address[:city],
        district: address[:district],
        address: address[:address],
        ddd: address[:ddd],
        count: 1
      )
      cep_record.save
    else
      cep_record.increment!(:count)
    end
  end
end
