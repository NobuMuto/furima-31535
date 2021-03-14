class Item < ApplicationRecord

  has_one_attached :image

  with_options presence:true do
    validate :name
    validate :detail
    validate :image
    validate :category
    validate :status
    validate :delivery_fee
    validate :delivery_area
    validate :delivery_date
    validate :price
  end

  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_date

  validates :price, format: { with: /\A[0-9]\z/, message: '半角数字を使用してください' } 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }

end
