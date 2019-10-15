class CreateTimesheets < ActiveRecord::Migration[5.2]
  def change
    create_table :timesheets do |t|
      t.date :today
      t.date :week_start
      t.date :week_end
      t.integer :hours_worked_today
      t.integer :hours_worked_week
      t.string :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
