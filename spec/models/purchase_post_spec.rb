require 'rails_helper'

RSpec.describe PurchasePost, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @purchase_post = FactoryBot.build(:purchase_post, item_id: item.id)
  end

  it '' do

  end
end
