# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create(name: "Car")
Category.create(name: "Groceries")
Category.create(name: "Entertainment")
Category.create(name: "Bills")
Category.create(name: "Restaurant")
Category.create(name: "Subscription")
Category.create(name: "Personal")
Category.create(name: "Other")


User.create(first_name: "test_user", password: "123", email: "123@test")

Expense.create(category_id: 1, user_id: 1, total_amount: 20)
Expense.create(category_id: 2, user_id: 1, total_amount: 40)
Expense.create(category_id: 3, user_id: 1, total_amount: 50)
