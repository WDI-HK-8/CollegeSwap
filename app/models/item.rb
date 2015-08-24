class Item < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :offers
	has_many :bookmarks
end
