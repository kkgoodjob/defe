class MessagesController < ApplicationController
  def create
    @message = Messages.new(message_params)
    if @message.save
      redirect_to item_negotiation_path(@message.negotiation.id)
    end
  end

  private 
  def message_params
    require(:message).permit(:text).merge(negotiation_id: negotiation.id)
  end
end
