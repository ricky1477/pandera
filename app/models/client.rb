class Client < ActiveRecord::Base
    has_many :invoices, foreign_key: "client_id"
end
