class AddStatusToEstimateTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates_todos, :status, :string
  end
end
