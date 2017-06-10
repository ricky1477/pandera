class Estimate < ActiveRecord::Base
    belongs_to :client

    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |estimate|
          csv << estimate.attributes.values_at(*column_names)
        end
      end
    end
end
