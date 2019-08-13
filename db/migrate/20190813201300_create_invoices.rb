class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :bill_to_info
      t.string :description
      t.date :date
      t.date :job_date
      t.integer :subtotal
      t.integer :tax
      t.integer :total
      t.integer :payments_credits
      t.integer :balance_remaining

      t.timestamps
    end
  end
end
