class Users < ActiveRecord: :Base
    # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
   has_many :items
   has_many :ratings
   has_many :comments
end 