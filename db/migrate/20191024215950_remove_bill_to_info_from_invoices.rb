class RemoveBillToInfoFromInvoices < ActiveRecord::Migration[5.2]
  def change
    remove_columns :invoices, :bill_to_info
    add_column :invoices, :name, :string
    add_column :invoices, :address1, :string
    add_column :invoices, :address2, :string
  end
end
