require 'rails_helper'

RSpec.describe purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end


  describe '購入機能' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力すると、商品の出品ができること' do
        expect(@post).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '必要な情報を適切に入力すると、商品の出品ができること' do
      
      end

      it '商品画像を1枚つけることが必須である' do
      
      end

      it '商品画像を1枚つけることが必須である' do
      
      end

      it '商品画像を1枚つけることが必須である' do
      
      end

      it '商品画像を1枚つけることが必須である' do
      
      end
    end
  end
end