class UsersController < ApplicationController

  def index
    @users = user.all

    render json: @users
  end

  def create
    @user = current_user.users.new(user_params)

    if @user.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
  end

  def update
    @user = user.find_by_id(params[:id])

    if @user.nil?
      render json: { message: "Cannot find user" }, status: :not_found
    else
      @user.update(user_params)
    end
  end

  def show
    @user = user.find_by_id(params[:id])

    if @user.nil?
      render json: { message: "Cannot find user" }, status: :not_found
    end
  end

  def destroy
    @user = user.find_by_id(params[:id])

    if @user.nil?
      render json: { message: "Cannot find user" }, status: :not_found
    else
      if @user.destroy
        render json: { message: "Successfully deleted" }, status: :no_content
      else
        render json: { message: "Unsuccessfully deleted" }, status: :bad_request 
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:title, :content, :category, :user_id)
  end

end
end