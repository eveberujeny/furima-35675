FactoryBot.define do
  factory :item do
    name            { 'test' }
    description     { 'テストです' }
    price           { 300 }
    category_id     { 2 }
    status_id       { 2 }
    burden_id       { 2 }
    source_id       { 2 }
    shipping_day_id { 2 }
    association :user
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima_test_image.png'), filename: 'furima_test_image.png')
    end
  end
end
