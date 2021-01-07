class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.where(user_id: params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item.update
    redirect_to root_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_s_name, :volume, :item_s_branch, :comments).merge(user_id: current_user.id)
  end
end
