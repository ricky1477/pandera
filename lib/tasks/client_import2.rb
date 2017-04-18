require 'csv'

csv_text = File.read('lib/tasks/data/garden-care2.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
    p row
    Client.create!(name: row[0], street_address: row[2], phone: row[3], email: row[4], credit: row[6], notes: row[7])
end