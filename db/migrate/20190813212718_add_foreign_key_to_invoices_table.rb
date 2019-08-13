class AddForeignKeyToInvoicesTable < ActiveRecord::Migration[5.2]
  def change
    add_reference :invoices, :work_order, foreign_key: true
  end
end
