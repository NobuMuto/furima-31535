require 'rails_helper'

RSpec.describe PurchasePost, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
    @purchase_post = FactoryBot.build(:purchase_post, item_id: item.id, user_id: user.id)
  end

  describe '購入機能' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@purchase_post).to be_valid
      end
    end

    context '新規登録できないとき' do

      it '郵便番号が空では登録できないこと' do
        @purchase_post.postal_code = nil
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include("Postal_code can't be blank")
      end

      it "都道府県が空では登録できないこと" do
        @purchase_post.delivery_area_id = nil
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include("Delivery_area can't be blank")
      end

      it "市区町村が空では登録できないこと" do
        @purchase_post.city = nil
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空では登録できないこと" do
        @purchase_post.number = nil
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include("Number can't be blank")
      end

      it "電話番号が空では登録できないこと" do
        @purchase_post.tel_number = nil
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include("Tel_number can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @purchase_post.token = nil
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include("Token can't be blank")
      end

      it '都道府県の情報が--でないこと' do
        @purchase_post.category_id = 1
        @purchase_post.valid?
        expect(@purchase_post.errors.full_messages).to include("Category must be other than 1")
        end

        it '郵便番号はハイフンなしでは登録できないこと' do
          @purchase_post.postal_code = 4569876
          @purchase_post.valid?
          expect(@purchase_post.errors.full_messages).to include("Postal_code is out of setting range")
        end

        it '電話番号にはハイフンは不要で、11桁以内であること' do
          @purchase_post.tel_number = 090123456789
          @purchase_post.valid?
          expect(@purchase_post.errors.full_messages).to include("Tel_number is out of setting range")
        end

    end
  end
end

