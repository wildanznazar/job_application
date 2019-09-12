# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
	email: "admin@admin.com",
	name: "Admin",
	role: "Admin",
	confirmed_at: Time.now,
	password: 123456
)

User.create(
	email: "company@company.com",
	name: "Company",
	role: "Company",
	confirmed_at: Time.now,
	password: 123456
)

User.create(
	email: "user@user.com",
	name: "User",
	role: "User",
	confirmed_at: Time.now,
	password: 123456
)
