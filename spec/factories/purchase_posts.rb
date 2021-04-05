FactoryBot.define do
  factory :purchase_post do
    user_id                { user.id }
    item_id                { item.id }
    postal_code        { 298-3847 }
    delivery_area_id   { 2 }
    city               { 'あか市' }
    number             { '５番地' }
    building           { 'プログラミングビル' }
    tel_number         { 09012345678 }
    purchase_id        { 2 }
    token              { 'tok_abcdefghijk00000000000000000' }
  end
# item = FactoryBot.create(:item)



end
