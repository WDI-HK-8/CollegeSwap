# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

School.delete_all
User.delete_all
Item.delete_all
Offer.delete_all

CSV.foreach("db/postscndryunivsrvy2013dirinfo.csv", encoding: "iso-8859-1:utf-8") do |row|
	School.create(name: row[1], city: row[3], state: row[4])
end

User.create(email: "hello@hello.com", password: "hellohello", school_id: School.where("name LIKE ?", '%Berkeley%').first.id)

User.create(email: "fer@fer.com", password: "ferferfer", school_id: School.where("name LIKE ?", '%Berkeley%').first.id)

User.create(email: "bill@chan.com", password: "12345678", school_id: School.where("name LIKE ?", '%University of Michigan%').first.id)

User.create(email: "koko@koko.com", password: "87654321", school_id: School.where("name LIKE ?", '%University of Michigan%').first.id)

Item.create(user_id: User.where(email: "hello@hello.com"), name: "Chair", description: "Gaga", price: 100, category: "Furniture")

Item.create(user_id: User.where(email: "hello@hello.com"), name: "Macaroni", description: "Good", price: 120, category: "Food")

Item.create(user_id: User.where(email: "fer@fer.com"), name: "New game", description: "Batman", price: 50, category: "Electronics")

Item.create(user_id: User.where(email: "fer@fer.com"), name: "Robot", description: "Can program", price: 700, category: "Electronics")

Item.create(user_id: User.where(email: "bill@chan.com"), name: "Hairpiece", description: "Dirty", price: 50, category: "Clothing")

Item.create(user_id: User.where(email: "bill@chan.com"), name: "Mcdonalds Hat", description: "Loving it", price: 10, category: "Clothing")

Item.create(user_id: User.where(email: "koko@koko.com"), name: "Forks", description: "For Eating", price: 23, category: "Utensils")

Item.create(user_id: User.where(email: "koko@koko.com"), name: "Clock", description: "Time", price: 100, category: "Furniture")