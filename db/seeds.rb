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

Item.create(user_id: User.where(email: "hello@hello.com").first.id, name: "Chair", description: "The best ever", price: 100, category: "Furniture", image: "http://www.exworkshop.com/upload/product/2012-09/27114227.jpg")

Item.create(user_id: User.where(email: "hello@hello.com").first.id, name: "Macaroni", description: "Good", price: 120, category: "Food", image: "http://catelli.ca/sites/default/files/classic-macaroni-and-cheese.jpg")

Item.create(user_id: User.where(email: "fer@fer.com").first.id, name: "New game", description: "Batman", price: 50, category: "Electronics", image: "https://upload.wikimedia.org/wikipedia/en/6/6c/Batman_Arkham_Knight_Cover_Art.jpg")

Item.create(user_id: User.where(email: "fer@fer.com").first.id, name: "Robot", description: "Can program", price: 700, category: "Electronics", image: "http://venturebeat.com/wp-content/uploads/2014/03/nao-robot.jpg")

Item.create(user_id: User.where(email: "bill@chan.com").first.id, name: "Hairpiece", description: "Dirty", price: 50, category: "Clothing", image: "http://www.dhresource.com/albu_261002653_00-1.0x0/hairpiece-ponytail-extension-loose-curls.jpg")

Item.create(user_id: User.where(email: "bill@chan.com").first.id, name: "Mcdonalds Hat", description: "Loving it", price: 10, category: "Clothing", image: "http://www.hiwtc.com/photo/products/13/01/67/16722.jpg")

Item.create(user_id: User.where(email: "koko@koko.com").first.id, name: "Forks", description: "For Eating", price: 23, category: "Utensils", image: "http://2i.c-b.co/is/image/CB2/PartyForkSet6LLF10/&$web_zoom$&/1308302041/party-forks-set-of-six.jpg")

Item.create(user_id: User.where(email: "koko@koko.com").first.id, name: "Clock", description: "Time", price: 100, category: "Furniture", image: "http://www.techspot.com/images2/downloads/topdownload/2014/12/alarmclock.png")