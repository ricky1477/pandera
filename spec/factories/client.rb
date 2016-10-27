FactoryGirl.define do
    factory :client do
        name 'TestClientName'
        street_address 'TestClientStreetAddress'
        sequence(:email) { |n| "test_client_email#{n}@mail.com" }
        city 'Gaithersburg'
        zipcode '20853'
        phone '(301) 519-210X'
    end
end