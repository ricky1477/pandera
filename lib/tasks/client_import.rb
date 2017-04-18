require 'csv'

csv_text = File.read('lib/tasks/data/garden-care.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
    p row
    row[1] ||= 'Unknown' 
    Client.create!(street_address: row[0], name: row[1], phone: row[3], email: row[4], credit: row[6], notes: row[7])
end