class AddFieldsToInvoicesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :project_name, :string
    add_column :invoices, :description5, :string
    add_column :invoices, :amount5, :decimal    
    add_column :invoices, :description6, :string
    add_column :invoices, :amount6, :decimal
    add_column :invoices, :description7, :string
    add_column :invoices, :amount7, :decimal
  end
end
