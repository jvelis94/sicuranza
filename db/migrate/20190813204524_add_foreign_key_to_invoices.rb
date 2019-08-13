class AddForeignKeyToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_reference :invoices, :work_orders, foreign_key: true
  end
end
