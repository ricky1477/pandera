json.extract! client, :id, :name, :address, :email, :phone, :dob, :created_at, :updated_at
json.url client_url(client, format: :json)