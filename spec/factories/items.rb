FactoryBot.define do
  factory :item do
    name                  {Faker::Name.initials}
    detail                
    image                 
    category_id              
    status                
    delivery_fee_id          
    delivery_area         {'北海道'}
    delivery_date         
    price                 

    association :user

        after(:build) do |item|
          item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        end

  end
end
