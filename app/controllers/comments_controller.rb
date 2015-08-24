class CommentsController < ApplicationController

  def index
    @comments = comment.all

    render json: @comments
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
  end

  def update
    @comment = comment.find_by_id(params[:id])

    if @comment.nil?
      render json: { message: "Cannot find comment" }, status: :not_found
    else
      @comment.update(comment_params)
    end
  end

  def show
    @comment = comment.find_by_id(params[:id])

    if @comment.nil?
      render json: { message: "Cannot find comment" }, status: :not_found
    end
  end

  def destroy
    @comment = comment.find_by_id(params[:id])

    if @comment.nil?
      render json: { message: "Cannot find comment" }, status: :not_found
    else
      if @comment.destroy
        render json: { message: "Successfully deleted" }, status: :no_content
      else
        render json: { message: "Unsuccessfully deleted" }, status: :bad_request 
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content, :category, :user_id)
  end

end
end