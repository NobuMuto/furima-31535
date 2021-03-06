require 'rails_helper'

RSpec.describe PurchasePost, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_post = FactoryBot.build(:purchase_post, user_id: @user.id, item_id: @item.id)
  end

  describe '購入機能' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@purchase_post).to be_valid
      end
    end

    it '番地が空で登録できること' do
      @purchase_post.building = ''
      expect(@purchase_post).to be_valid
    end

    context '新規登録できないとき' do
      it 'user_idが空では登録できないこと' do
        @purchase_post.user_id = ''
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include("User can't be blank")
      end
      
      it 'item_idが空では登録できないこと' do
        @purchase_post.item_id = ''
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include("Item can't be blank")
      end
      
      it '郵便番号が空では登録できないこと' do
        @purchase_post.postal_code = ''
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include('Postal code 半角数字を使用してください')
      end

      it '都道府県が空では登録できないこと' do
        @purchase_post.delivery_area_id = ''
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include('Delivery area is not a number')
      end

      it '市区町村が空では登録できないこと' do
        @purchase_post.city = ''
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できないこと' do
        @purchase_post.number = ''
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include("Number can't be blank")
      end

      it '電話番号が空では登録できないこと' do
        @purchase_post.tel_number = ''
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include('Tel number 半角数字を使用してください')
      end

      it 'tokenが空では登録できないこと' do
        @purchase_post.token = ''
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include("Token can't be blank")
      end

      it '都道府県の情報が--でないこと' do
        @purchase_post.delivery_area_id = 1
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include('Delivery area must be other than 1')
      end

      it '郵便番号はハイフンなしでは登録できないこと' do
        @purchase_post.postal_code = '4569876'
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include('Postal code 半角数字を使用してください')
      end

      it '電話番号にはハイフンは不要で、11桁以内であること' do
        @purchase_post.tel_number = '090123456789'
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include('Tel number 半角数字を使用してください')
      end

      it '電話番号は英数混合では登録できない事' do
        @purchase_post.tel_number = '090123456aa'
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include('Tel number 半角数字を使用してください')
      end
    end
  end
end
