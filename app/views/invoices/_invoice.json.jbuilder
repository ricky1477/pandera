json.extract! invoice, :id, :client_id, :invoice_number, :maturity, :date_of_service, :description, :price, :total, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)