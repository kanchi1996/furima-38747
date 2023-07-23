require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '出品できるとき' do
      it 'name、description、category_id、condition_id、delivery_charge_id、prefecture_id、transport_day_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'descriptionが空では出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.transport_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Transport day can't be blank"
      end
      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '販売価格が￥300より少ない時は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it '販売価格が￥9999999より多い時は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it 'ユーザーが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
      it 'priceは(半角数値)でなければ出品できない' do
        @item.price= "３００" 
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid. Input half-width characters" 
      end
    end
  end
end