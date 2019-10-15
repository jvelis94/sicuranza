class CreateEstimatesTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates_todos do |t|
      t.string :client
      t.string :project
      t.date :blueprint_email_date

      t.timestamps
    end
  end
end
