FactoryBot.define do
  factory :purchase_post do
    user_id                { item.id }
    item_id                { item.id }
    postal_code        { 298-3847 }
    delivery_area_id   { 2 }
    city               { 'あか市' }
    number             { '５番地' }
    building           { 'プログラミングビル' }
    tel_number         {  }
    purchase_id        { 2 }
    token              { 2 }
  end
# item = FactoryBot.create(:item)



end
