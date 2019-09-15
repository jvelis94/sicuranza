class AddCompletedAtToPunchlistitems < ActiveRecord::Migration[5.2]
  def change
    add_column :punchlistitems, :completed_at, :datetime
  end
end
