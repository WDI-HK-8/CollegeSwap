class SchoolsController < ApplicationController
	def index
		@schools = School.all
		
		render json: @schools
	end

  def show
    @school = School.find_by_id(params[:id])
    
    render json: @school
  end
end
