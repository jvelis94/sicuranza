class AddForeignKeyToWorkOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :work_orders, :user, foreign_key: true
    
  end
end
