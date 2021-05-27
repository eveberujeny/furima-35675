class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :source_id
    validates :shipping_day_id
  end

  belongs_to :user






  class Genre < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: '経済' },
      { id: 3, name: '政治' },
      { id: 4, name: '地域' },
      { id: 5, name: '国際' },
      { id: 6, name: 'IT' },
      { id: 7, name: 'エンタメ' },
      { id: 8, name: 'スポーツ' },
      { id: 9, name: 'グルメ' },
      { id: 10, name: 'その他' }
    ]
    end
end
