class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buyer, only: [:index, :create, :move_to_index]
  before_action :move_to_index, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :number, :cvc, :exp_month, :exp_year).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def set_buyer
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buyer_params[:token],
        currency: 'jpy'
      )
  end

  def move_to_index
    if current_user.id == @item.user_id || Buyer.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end
end
