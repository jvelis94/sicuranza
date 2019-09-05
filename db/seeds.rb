# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts 'destroying old users, work orders and invoices'

Invoice.destroy_all
WorkOrder.destroy_all
User.destroy_all



puts 'creating User'

seedUser = User.create!(
    email: 'velisjoel@gmail.com',
    password: 123456,
)

# puts 'creating work order'

# seedWorkOrder = WorkOrder.create!(
#     technician: 'Joel',
#     location: '12003 Rockaway Blvd',
#     hours: 10,
#     customer_name: 'Nohely',
#     customer_street_address: '11514 111th Ave',
#     customer_city: 'SOP',
#     customer_zip_code: '11420',
#     customer_phone_number: '6463797906',
#     customer_email: 'johely0807@gmail.com',
#     job_details: 'fixed drain',
#     user: seedUser
# )

# puts 'creating invoice'

# seedInvoice = Invoice.create!(
#     subtotal: 100,
#     tax: 10,
#     total: 110,
#     balance_remaining: 110,
#     work_order: seedWorkOrder
# )

