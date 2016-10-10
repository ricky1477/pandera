FactoryGirl.define do
    factory :shipping_address do
        name 'TestShippingAddress'
        street 'TestShippingStreet'
        city 'TestShippingCity'
        state 'TestShippingState'
        zipcode '20906'
        is_default true
    end
end
