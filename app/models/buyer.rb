class Buyer < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :addresses
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
