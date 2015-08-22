class Users < ActiveRecord: :Base
   has_many :items
   has_many :ratings
   has_many :comments
end 