class RemoveWorkOrdersIdFromInvoicesTable < ActiveRecord::Migration[5.2]
  def change
    remove_reference :invoices, :work_orders, foreign_key: true
  end
end
