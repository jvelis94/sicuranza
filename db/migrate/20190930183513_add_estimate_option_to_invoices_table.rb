class AddEstimateOptionToInvoicesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :type, :string
  end
end
