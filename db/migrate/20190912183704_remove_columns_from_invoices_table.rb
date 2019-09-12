class RemoveColumnsFromInvoicesTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoices, :description
    remove_column :invoices, :description2
    remove_column :invoices, :description3
    remove_column :invoices, :description4
    remove_column :invoices, :description5
    remove_column :invoices, :description6
    remove_column :invoices, :description7
    remove_column :invoices, :amount
    remove_column :invoices, :amount2
    remove_column :invoices, :amount3
    remove_column :invoices, :amount4
    remove_column :invoices, :amount5
    remove_column :invoices, :amount6
    remove_column :invoices, :amount7
  end
end
