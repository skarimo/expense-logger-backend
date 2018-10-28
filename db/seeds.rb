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


User.create(first_name: "Jack", last_name: "Chan", username: "jack", password: "123", email: "123@test")
User.create(first_name: "Log", last_name: "Puts", username: "Log", password: "123", email: "log@test")
User.create(first_name: "Let", last_name: "Pence", username: "Let", password: "123", email: "let@test")
User.create(first_name: "Mike", last_name: "Chan", username: "mike", password: "123", email: "mike@test")
User.create(first_name: "felix", last_name: "chan", username: "felix", password: "123", email: "felix@test")

Expense.create(category_id: 1, user_id: 1, date: "01/05/10", total_amount: 20)
Expense.create(category_id: 1, user_id: 1, date: "02/05/10", total_amount: 10)
Expense.create(category_id: 1, user_id: 1, date: "03/05/10", total_amount: 30)
Expense.create(category_id: 2, user_id: 1, date: "04/05/10", total_amount: 40)
Expense.create(category_id: 3, user_id: 1, date: "05/05/10", total_amount: 50)


Friendship.create(user_id: 2, friend_id: 1)
Friendship.create(user_id: 3, friend_id: 1)
Friendship.create(user_id: 4, friend_id: 1)
Friendship.create(user_id: 5, friend_id: 1)











#
