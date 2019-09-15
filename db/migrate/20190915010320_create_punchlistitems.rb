class CreatePunchlistitems < ActiveRecord::Migration[5.2]
  def change
    create_table :punchlistitems do |t|
      t.string :content
      t.references :jobpunchlist, foreign_key: true

      t.timestamps
    end
  end
end
