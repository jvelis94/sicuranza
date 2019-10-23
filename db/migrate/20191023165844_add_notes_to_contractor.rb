class AddNotesToContractor < ActiveRecord::Migration[5.2]
  def change
      add_column :contractors, :notes, :string
  end
end
