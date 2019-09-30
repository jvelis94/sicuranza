class RenameColumnTypeInInvoicesTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :invoices, :type, :job_type
  end
end
