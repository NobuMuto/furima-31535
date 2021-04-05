class PurchasePost
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_area_id, :city, :number, :building, :tel_number, :token

  # ここにバリデーションの処理を書く
  #purchase 
  #post
  
  with_options validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '半角数字を使用してください' } do
    validates :postal_code
  end

  with_options numericality: { other_than: 1 } do
    validates :delivery_area_id
  end


  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :city
  end

  with_options presence: true do
    validates :number
    validates :token
  end

  validates :tel_number, presence: true, format: { with:  /\A\d{10}$|^\d{11}\z/, message: '半角数字を使用してください' }


  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Post.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, number: number, building: building, tel_number: tel_number, purchase_id: purchase.id)
  end
end