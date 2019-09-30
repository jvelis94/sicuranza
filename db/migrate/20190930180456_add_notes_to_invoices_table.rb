class AddNotesToInvoicesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :notes, :string
  end
end
