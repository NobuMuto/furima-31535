FactoryBot.define do
  factory :item do
    name                  { '空' }
    detail                { '美しい' }
    category_id           { '1' }
    status                { '1' }
    delivery_fee_id       { '1' }
    delivery_area         { '1' }
    delivery_date         { '1' }
    price                 { '10000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
