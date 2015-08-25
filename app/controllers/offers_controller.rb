class OffersController < ApplicationController

	def indexOffers
  	@item = Item.find_by_id(params[:id])
  	@offers = @item.offers.all

  	render json: @offers
  end

  def createOffer
  	@item = Item.find_by_id(params[:id])
    @offer = @item.offers.new(offer_params)

    if @offer.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
  end

  def updateOffer
    @offer = Offer.find_by_id(params[:id])

    if @offer.nil?
      render json: { message: "Cannot find offer" }, status: :not_found
    else
      @offer.update(offer_params)
    end
  end

  def showOffer
    @offer = Offer.find_by_id(params[:id])

    if @offer.nil?
      render json: { message: "Cannot find offer" }, status: :not_found
    end
  end

  def destroyOffer
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

  private

  def offer_params
    params.require(:offer).permit(:text, :time, :location, :item_id, {:user_id => [current_user.id]})
  end

end
