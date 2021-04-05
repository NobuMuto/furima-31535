FactoryBot.define do
  factory :post do
    postal_code        { 298 - 3847 }
    delivery_area_id   { 2 }
    city               { 'あか市' }
    number             { '５番地' }
    building           { 'プログラミングビル' }
    tel_number         {}
    purchase_id        { 2 }
    token              { 2 }
  end
end
