class Purchase
  include ActiveModel::Model
  attr_accessor :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :name, :detail, :image, :category_id, :status_id, :delivery_fee_id, :delivery_area_id,
                :delivery_date_id, :price, :token

  # ここにバリデーションの処理を書く
  #user
  validates :nickname, :birthday, presence: true

  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字を使用してください' } do
    validates :password
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カナ文字を使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  #item

  with_options presence: true do
    validates :name
    validates :detail
    validates :image
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :delivery_area_id
    validates :delivery_date_id
  end

  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end