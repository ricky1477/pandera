FactoryGirl.define do
    factory :admin do
        sequence(:email) { |n| "email#{n}@mail.com" }
        password "secret"
    end
end