class NegotiationsController < ApplicationController
  def index
    @items = Item.where(user_id: params[:item_id])
    @messages = Message.where(negotiation_id: params[:item_id])
  end
end
