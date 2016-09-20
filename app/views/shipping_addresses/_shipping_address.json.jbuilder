json.extract! shipping_address, :id, :name, :street, :city, :state, :zipcode, :created_at, :updated_at
json.url shipping_address_url(shipping_address, format: :json)