class SchoolsController < ApplicationController

  def indexSchool
    @schools = School.all.map {|u| u.name}

    render json: @schools
  end

  def createSchool
    @school = Schools.new(school_params)

    if @school.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
  end

  def updateSchool
    @school = School.find_by_id(params[:id])

    if @school.nil?
      render json: { message: "Cannot find school" }, status: :not_found
    else
      @school.update(school_params)
    end
  end

  def showSchool
    @school = School.find_by_id(params[:id])

    if @school.nil?
      render json: { message: "Cannot find school" }, status: :not_found
    end
  end

  def destroySchool
    @school = School.find_by_id(params[:id])

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
    params.require(:school).permit(:name, :city, :state)
  end

end


end