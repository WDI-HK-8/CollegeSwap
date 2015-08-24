# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

School.delete_all

CSV.foreach("db/postscndryunivsrvy2013dirinfo.csv", encoding: "iso-8859-1:utf-8") do |row|
	School.create(name: row[1], city: row[3], state: row[4])
end