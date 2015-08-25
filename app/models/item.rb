class Item < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :offers
	has_many :bookmarks

  has_attached_file :image, styles: {
    medium: "300x300>",
    thumb: "100x100>"
  }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
