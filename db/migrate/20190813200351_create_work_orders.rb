class CreateWorkOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :work_orders do |t|
      t.string :technician
      t.date :date
      t.string :location
      t.integer :hours
      t.string :customer_name
      t.string :customer_street_address
      t.string :customer_city
      t.string :customer_zip_code
      t.string :customer_phone_number
      t.string :customer_email
      t.string :job_details

      t.timestamps
    end
  end
end
