# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#User.create!(username: "admin" , user_type: "Admin", email: 'admin@example.com', password: 'password', #assword_confirmation: 'password') if Rails.env.development?


Tab.where(name: "Admin User").first_or_create
Tab.where(name: "Course").first_or_create
Tab.where(name: "User Course").first_or_create
Tab.where(name: "User").first_or_create

AdminUserTab.where(admin_user_id: 2, tab_id: 1, access: "Read/Write").first_or_create
AdminUserTab.where(admin_user_id: 2, tab_id: 2, access: "Read/Write").first_or_create
AdminUserTab.where(admin_user_id: 2, tab_id: 3, access: "Read/Write").first_or_create
AdminUserTab.where(admin_user_id: 2, tab_id: 4, access: "Read/Write").first_or_create



