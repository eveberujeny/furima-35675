class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :burden_id
      validates :source_id
      validates :shipping_day_id  
    end  
  end 

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :source
  belongs_to :shipping

end
