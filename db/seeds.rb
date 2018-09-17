# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#AdminUser.create!( email: 'admin@example.com', password: 'password', password_confirmation: 'password') if #Rails.env.development?


AdminUserTab.where(admin_user_id: 7, tab_id: 13, access: "Read/Write").first_or_create
AdminUserTab.where(admin_user_id: 7, tab_id: 14, access: "Read/Write").first_or_create
AdminUserTab.where(admin_user_id: 7, tab_id: 15, access: "Read/Write").first_or_create
AdminUserTab.where(admin_user_id: 7, tab_id: 16, access: "Read/Write").first_or_create


