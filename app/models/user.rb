class User < ActiveRecord::Base

      # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
   has_many :item
   has_many :rating
   has_many :comment
end
