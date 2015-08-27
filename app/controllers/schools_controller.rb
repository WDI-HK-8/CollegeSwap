class SchoolsController < ApplicationController
	def index
		@schools = School.all
		
		render json: @schools
	end

	def show
    @school = School.find_by_id(params[:id])

    if @school.nil?
      render json: { message: "Cannot find school" }, status: :not_found
    end
  end
end
