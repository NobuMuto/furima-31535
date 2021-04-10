FactoryBot.define do
  factory :purchase_post do
    postal_code        { '298-3847' }
    delivery_area_id   { 2 }
    city               { 'あか市' }
    number             { '５番地' }
    building           { 'プログラミングビル' }
    tel_number         { '09012345678' }
    token              { 'tok_abcdefghijk00000000000000000' }
  end
end
