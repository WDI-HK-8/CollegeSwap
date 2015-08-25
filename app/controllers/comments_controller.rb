class CommentsController < ApplicationController
	def indexComments
  	@item = Item.find_by_id(params[:id])
  	@comments = @item.comments.all

  	render json: @comments
  end

  def createComment
  	@item = Item.find_by_id(params[:id])
    @comment = @item.comments.new(comment_params)

    if @comment.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
  end

  def updateComment
    @comment = Comment.find_by_id(params[:id])

    if @comment.nil?
      render json: { message: "Cannot find comment" }, status: :not_found
    else
      @comment.update(comment_params)
    end
  end

  def showComment
    @comment = Comment.find_by_id(params[:id])

    if @comment.nil?
      render json: { message: "Cannot find comment" }, status: :not_found
    end
  end

  def destroyComment
    @comment = Comment.find_by_id(params[:id])

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
    params.require(:comment).permit(:text, :item_id, {:user_id => [current_user.id]})
  end

end