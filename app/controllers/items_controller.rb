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

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :burden_id, :source_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
