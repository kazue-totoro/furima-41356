require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it 'post_codeとprefecture_id、city、block、phone_numberが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'post_codeが空では購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank",
                                                               'Post code input correctly')
      end
      it 'post_codeは、「3桁ハイフン4桁」の半角文字列でなければ購入できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code input correctly')
      end
      it 'prefecture_idが空では購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では購入できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank",
                                                               'Phone number input only number')
      end
      it 'phone_numberは、10桁以上11桁以内の半角数値でなければ購入できない' do
        @order_address.phone_number = 123
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number input only number')
      end
      it 'phone_numberは、10桁以上11桁以内の半角数値でなければ購入できない' do
        @order_address.phone_number = '１２３４５６７８９１０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number input only number')
      end
      it '紐づくユーザーが存在しないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it '紐づくアイテムが存在しないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
