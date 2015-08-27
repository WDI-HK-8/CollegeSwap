class UsersController < ApplicationController

  def index
  end

  def update 
     @user = User.find_by_id(params[:id])

    if @user.nil?
      render json: { message: "Cannot find item" }, status: :not_found
    else
      @user.update(user_params)
    end
  end 

  private

  def user_params
    params.require(:user).permit(:image)
  end

end