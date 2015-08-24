class ItemsController < ApplicationController
  def index
    @items = item.all

    render json: @items
  end

  def create
    @item = current_user.items.new(item_params)

    if @item.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
  end

  def update
    @item = item.find_by_id(params[:id])

    if @item.nil?
      render json: { message: "Cannot find item" }, status: :not_found
    else
      @item.update(item_params)
    end
  end

  def show
    @item = item.find_by_id(params[:id])

    if @item.nil?
      render json: { message: "Cannot find item" }, status: :not_found
    end
  end

  def destroy
    @item = item.find_by_id(params[:id])

    if @item.nil?
      render json: { message: "Cannot find item" }, status: :not_found
    else
      if @item.destroy
        render json: { message: "Successfully deleted" }, status: :no_content
      else
        render json: { message: "Unsuccessfully deleted" }, status: :bad_request 
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :content, :category, :user_id)
  end

end