class SchoolsController < ApplicationController

  def index
    @schools = school.all

    render json: @schools
  end

  def create
    @school = current_user.schools.new(school_params)

    if @school.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
  end

  def update
    @school = school.find_by_id(params[:id])

    if @school.nil?
      render json: { message: "Cannot find school" }, status: :not_found
    else
      @school.update(school_params)
    end
  end

  def show
    @school = school.find_by_id(params[:id])

    if @school.nil?
      render json: { message: "Cannot find school" }, status: :not_found
    end
  end

  def destroy
    @school = school.find_by_id(params[:id])

    if @school.nil?
      render json: { message: "Cannot find school" }, status: :not_found
    else
      if @school.destroy
        render json: { message: "Successfully deleted" }, status: :no_content
      else
        render json: { message: "Unsuccessfully deleted" }, status: :bad_request 
      end
    end
  end

  private

  def school_params
    params.require(:school).permit(:title, :content, :category, :user_id)
  end

end


end
