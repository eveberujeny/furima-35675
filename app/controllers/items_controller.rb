class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @Item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :burden_id, :source_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
