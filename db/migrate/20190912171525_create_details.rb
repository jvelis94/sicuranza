class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.string :description
      t.integer :amount
      t.integer :invoice_id

      t.timestamps
    end
  end
end
