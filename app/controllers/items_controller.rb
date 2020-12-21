class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_s_name, :volume, :item_s_branch, :comments).merge(user_id: current_user.id)
  end
end
