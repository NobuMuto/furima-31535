class Item < ApplicationRecord

  has_one_attached :image

  with_options presence:true do
    validate :category
    validate :status
    validate :delivery_fee
    validate :delivery_area
    validate :delivery_date
  end

  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_date

end
