class AddUserRefToEstimatesTodos < ActiveRecord::Migration[5.2]
  def change
    add_reference :estimates_todos, :user, foreign_key: true
  end
end
