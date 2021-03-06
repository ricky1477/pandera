# frozen_string_literal: true

# This defines the business requirements for the Invoice
class Invoice < ActiveRecord::Base
  before_create :compute_invoice_num
  before_save :check_if_paid
  before_create :link_services_to_invoice
  before_create :compute_total
  # before_destroy :unlink_services_to_invoice
  belongs_to :client
  validates :client_id, presence: true
  has_many :services, dependent: :destroy

  def compute_invoice_num
    self.invoice_number = (Invoice.all.length <= 0) ? ((1).to_s + Time.now.year.to_s ).to_i : ( (Invoice.last.id + 1).to_s + Time.now.year.to_s ).to_i
  end

  def check_if_paid
    if paid
      services.each do |service|
        service.paid = true
        service.save!
      end
    end
  end

  def link_services_to_invoice
    self.services = client.services.where('paid IS NOT TRUE')
                          .where('invoice_id IS NULL')
  end

  # def unlink_services_to_invoice
  #   self.services.each do |service|
  #       service.invoice_id = nil
  #       service.save!
  #   end
  # end

  def compute_total
    prices = client.services.where("paid IS NOT TRUE").where("invoice_id IS NULL").pluck(:price)
    if prices.length <= 0
      self.total = 0
    else
      self.total = prices.inject(0) { |sum, x| sum + x }
    end
  end

  def self.search(search)
    if search
      joins('JOIN clients ON clients.id = invoices.client_id')
        .where('clients.name ILIKE ? OR CAST( invoice_number AS text ) ILIKE ?
        OR CAST(maturity AS text) ILIKE ? OR description ILIKE ?
        OR CAST(total as text) ILIKE ?',
               "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%",
               "%#{search}%")
    else
      where(nil)
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ['Client Name', 'Invoice Number', 'Description', 'Total', 'Paid',
              'Check Number']
      all.each do |invoice|
        data = [invoice.client.name, invoice.invoice_number,
                invoice.description, invoice.total, invoice.paid.present?,
                invoice.check_number]
        csv << data
      end
    end
  end
end
