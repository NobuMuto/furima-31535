require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品' do

    context '新規登録できるとき' do

      it 'ログイン状態のユーザーだけが、商品出品ページへ遷移できる'
  
      end

      it 'ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移する'

      end

      it '入力された販売価格によって、販売手数料や販売利益の表示が変わること'

      end

      it '必要な情報を適切に入力すると、商品の出品ができること'
      expect(@item).to be_valid
      end

      it 'エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させること）'

      end

      it '入力に問題がある状態で出品ボタンが押されたら、出品ページに戻りエラーメッセージが表示されること'

      end

    end


    context '新規登録できないとき' do

      it '商品画像を1枚つけることが必須である'
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること'
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が必須であること'
      @item.detail = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
      end

      it 'カテゴリーの情報が必須であること'
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category_id can't be blank")
      end

      it '商品の状態についての情報が必須であること'
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status_id can't be blank")
      end

      it '配送料の負担についての情報が必須であること'
      @item.delivery_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery_fee_id can't be blank")
      end

      it '発送元の地域についての情報が必須であること'
      @item.delivery_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery_area_id can't be blank")
      end

      it '発送までの日数についての情報が必須であること'
      @item.delivery_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery_date_id can't be blank")
      end

      it '価格についての情報が必須であること'
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、~¥299では登録できない'
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("is out of setting range")
      end

      it '価格の範囲が、¥10,000,000~では登録できない'
      @item.price = "10,000,000"
      @item.valid?
      expect(@item.errors.full_messages).to include("is out of setting range")
      end

      it '販売価格は半角数字のみ保存可能であること'
      @item.price = "100aあ"
      @item.valid?
      expect(@item.errors.full_messages).to include("半角数字を使用してください")
      end

    end
  end
end
