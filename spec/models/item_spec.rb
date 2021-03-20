require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力すると、商品の出品ができること' do
      expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '商品画像を1枚つけることが必須である' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が必須であること' do
      @item.detail = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態についての情報が必須であること' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担についての情報が必須であること' do
      @item.delivery_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it '発送元の地域についての情報が必須であること' do
      @item.delivery_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '発送までの日数についての情報が必須であること' do
      @item.delivery_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end

      it 'カテゴリーの情報が--でないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
  
        it '商品の状態についての情報が--でないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
        end
  
        it '配送料の負担についての情報が--でないこと' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
        end
  
        it '発送元の地域についての情報が--でないこと' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
        end
  
        it '発送までの日数についての情報が--でないこと' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
        end  

      it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、~¥299では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it '価格の範囲が、¥10,000,000~では登録できない' do
      @item.price = 10,000,000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it '販売価格は全角文字では登録できないこと' do
      @item.price = "ああああ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it '販売価格は半角英語だけでは登録できないこと' do
      @item.price = "abcd"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end