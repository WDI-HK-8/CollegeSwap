class UsersController < ApplicationController
def index
      users = user.all
      render json: users
    end
end