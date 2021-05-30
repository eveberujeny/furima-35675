require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品が出品できるとき' do

      it 'name、description、price、category_id、status_id、burden_id、source_id、shipping_day_id、imageが全て入力されているときに出品できること' do
        expect(@item).to be_valid
      end

      it 'priceが¥300以上だと登録できること' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it 'priceが¥9,999,999以下だと登録できること' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      
      it 'nameが空の場合登録できないこと'do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空だと登録できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      
      it 'category_idが未選択だと登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'burden_idが未選択だと登録できないこと' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end

      it 'source_idが未選択だと登録できないこと' do
        @item.source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Source must be other than 1")
      end

      it 'shipping_day_idが未選択だと登録できないこと' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it 'priceが空だと登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが¥300以下だと登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが¥9,999,999以上だと登録できないこと' do
        @item.price = 99999999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'pricdが全角数字の場合は登録できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'imageが未選択だと登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
