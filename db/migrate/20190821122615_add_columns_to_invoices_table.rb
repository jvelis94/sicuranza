class AddColumnsToInvoicesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :amount, :decimal
    add_column :invoices, :description2, :string
    add_column :invoices, :amount2, :decimal    
    add_column :invoices, :description3, :string
    add_column :invoices, :amount3, :decimal
    add_column :invoices, :description4, :string
    add_column :invoices, :amount4, :decimal

  end
end
