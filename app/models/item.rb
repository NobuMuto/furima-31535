class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image

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

  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_date

  belongs_to :user
  has_one    :purchase

  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
