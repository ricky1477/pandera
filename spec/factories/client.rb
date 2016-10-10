FactoryGirl.define do
    factory :client do
        name 'Test2'
        street_address 'Test2'
        sequence(:email) { |n| "email#{n}@mail.com" }
    end
end