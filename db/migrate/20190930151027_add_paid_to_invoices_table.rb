class AddPaidToInvoicesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :paid, :boolean
  end
end
