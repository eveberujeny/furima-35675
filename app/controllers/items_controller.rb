class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:show, :edit, :update, :move_to_edit]
  before_action :move_to_edit, only: [:edit, :update]
  
  
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show   
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end



  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :burden_id, :source_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_edit
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end


