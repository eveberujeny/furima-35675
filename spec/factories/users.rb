FactoryBot.define do
  factory :user do
    first_name            { '太郎'}
    last_name             { '山田' }
    nickname              { 'test' }
    name_reading          { 'ベル' }
    surname_reading       { 'イヴ' }
    birthday              {'2000-01-01'}
    email                 {Faker::Internet.free_email}
    password              {'a00000'}
    password_confirmation {password}
  end
end
