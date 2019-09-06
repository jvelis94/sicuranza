class CreateContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|
      t.string :name
      t.string :address1
      t.string :city
      t.string :state
      t.bigint :zip
      t.bigint :phone

      t.timestamps
    end
  end
end
