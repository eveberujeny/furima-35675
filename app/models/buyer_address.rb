class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end

end