class ChangeTaxToDecimalInInvoices < ActiveRecord::Migration[5.2]
  def change
    change_column :invoices, :tax, :decimal
  end
end
