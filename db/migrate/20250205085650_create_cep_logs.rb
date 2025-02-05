class CreateCepLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :cep_logs do |t|
      t.string :cep
      t.string :state
      t.string :city
      t.string :district
      t.string :address
      t.string :ddd
      t.integer :count

      t.timestamps
    end
  end
end
