class NegotiationsController < ApplicationController
  def index
    @items = Item.where(user_id: params[:item_id])
    @negotiation = Negotiation.create(negotiation_params)
    @message = Message.new
    @messages = @negotiation.messages.includes(:user)
  end

  def create
    Negotiation.create(negotiation_params)
  end

  private

  def negotiation_params
    params.permit(:item_id, :store_id).merge(user_id: current_user.id, attributing_id: current_user.attributing_id)
  end
end
