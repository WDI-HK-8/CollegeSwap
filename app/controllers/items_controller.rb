class ItemsController < ApplicationController
	before_action :authenticate_user!

	def index
    @items = Item.all

    # render json: @items
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
    @item = Item.find_by_id(params[:id])

    if @item.nil?
      render json: { message: "Cannot find item" }, status: :not_found
    else
      @item.update(item_params)
    end
  end

  def show
    @item = Item.find_by_id(params[:id])

    if @item.nil?
      render json: { message: "Cannot find item" }, status: :not_found
    end
  end

  def destroy
    @item = Item.find_by_id(params[:id])

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

  def search
  	@items = Items.where("lower(name || description)", "%#{params[:query].downcase}%")
  	# render json: @items
  end

  def swap
  	@items = Item.where(accepted: false, user_id: User.where(school_id: current_user.school_id).pluck(:id)).where("user_id != ?", current_user.id)

  	# render json: @items
  end

  def myItems
  	@items=Item.where(user_id: current_user.id)

  	# render json: @items
  end

  def myItemsToSwap
    @items=Item.where(user_id: current_user.id, accepted: false)

    # render json: @items
  end

  private

  def item_params
    params.require(:item).permit(:name, :category, :image, :description, :price, {:user_id => [current_user.id]})
  end
end