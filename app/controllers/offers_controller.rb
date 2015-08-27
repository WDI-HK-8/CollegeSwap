class OffersController < ApplicationController

	def index
  	@item = Item.find_by_id(params[:item_id])
  	@offers = @item.offers.all

  end

  def create
  	@item = Item.find_by_id(params[:item_id])
    @offer = @item.offers.new(offer_params.merge(user_id: current_user.id))

    if @offer.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
  end

  def update
    @offer = Offer.find_by_id(params[:id])

    if @offer.nil?
      render json: { message: "Cannot find offer" }, status: :not_found
    else
      @offer.update(offer_params)
    end
  end

  def show
    @offer = Offer.find_by_id(params[:id])

    if @offer.nil?
      render json: { message: "Cannot find offer" }, status: :not_found
    end
  end

  def destroy
    @offer = Offer.find_by_id(params[:id])

    if @offer.nil?
      render json: { message: "Cannot find offer" }, status: :not_found
    else
      if @offer.destroy
        render json: { message: "Successfully deleted" }, status: :no_content
      else
        render json: { message: "Unsuccessfully deleted" }, status: :bad_request 
      end
    end
  end

  def acceptOffer
    @offer = Offer.find_by_id(params[:id])
    @offer.update(accepted: true)
    @offer.item.update(accepted: true)
  end

  private

  def offer_params
    params.require(:offer).permit(:text, :time, :location, :item_id, :user_id, :itemtoswap)
  end

end
