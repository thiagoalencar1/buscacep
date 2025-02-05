class CepLog < ApplicationRecord
  validates :cep, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :district, presence: true
  validates :address, presence: true
  validates :ddd, presence: true

  scope :last_5, -> { order(count: :desc).limit(5) }

  def log(cep, state, city, district, address, ddd)
    cep_record = find_by(cep: cep)

    if cep_record.nil?
      cep_record = CepLog.new(
        cep: cep,
        state: state,
        city: city,
        district: district,
        address: address,
        ddd: ddd,
        count: 1
      )
      cep_record.save
    else
      cep_record.increment!(:count)
    end
end
