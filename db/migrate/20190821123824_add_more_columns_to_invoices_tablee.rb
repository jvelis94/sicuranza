class AddMoreColumnsToInvoicesTablee < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :description, :string
  end
end
