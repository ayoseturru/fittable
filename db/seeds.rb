# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "test", password: "12345678", password_confirmation: "12345678", email: "test@test.test")
User.create(username: "test2", password: "12345678", password_confirmation: "12345678", email: "test2@test.test")
