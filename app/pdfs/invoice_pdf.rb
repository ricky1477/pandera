class InvoicePdf < Prawn::Document

  def initialize(invoices, view)
    super()
    @invoices = invoices
    @view = view
		if invoices.class.to_s == 'Invoice'
			@invoice = @invoices
    	#logo
			title
			bill_to
			services
			footer
		else
			@invoices.each_with_index do |invoice, i|
				@invoice = invoice
    		#logo
				title
				bill_to
				services
				footer
				start_new_page unless i == @invoices.length-1
			end
		end
  end

	def logo
    logopath =  "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 197, :height => 91
    move_down 10
    draw_text "Receipt", :at => [220, 575], size: 22
  end

	def title
		sa = ShippingAddress.where("is_default IS TRUE").first
		text sa.name, style: :bold
		text sa.street, style: :bold
		text sa.city + ', ' + sa.state + ' ' + sa.zipcode, style: :bold
		date = "Date #{@invoice.created_at.strftime("%m/%d/%Y")}"
		text_box "Invoice" ,
		 :at => [400,720], :height => 100, :width => 100, :style => :bold, :size => 25
		text_box date,
		 :at => [400,695], :height => 100, :width => 100, :style => :bold, :size => 12
		text_box "Invoice# #{@invoice.invoice_number}",
		 :at => [400,680], :height => 100, :width => 100, :style => :bold, :size => 12
		text " \n " * 5
	end

	def bill_to
		text 'Bill To', style: :bold
		text @invoice.client.name
		text @invoice.client.street_address
		text @invoice.client.city + ' ' + @invoice.client.zipcode
	end

	def services
		text " \n " * 3
		text 'Services', style: :bold, size: 18
		data = [["Description                                       ", "Date of service                     ", "Price         ", "Total          "]]

		@invoice.services.each do |srvc|
			data << [srvc.description, srvc.date.to_s, srvc.price.to_s, srvc.price.to_s]
		end

		table(data, :row_colors => ["F0F0F0","FFFFFF"])
	end

	def footer
		sa = ShippingAddress.where("is_default IS TRUE").first
		text_box "Please make checks payable to: \n #{sa.name}",
			:at => [0,35], :height => 100, :width => 250, :size => 12
		text_box "Subtotal #{@invoice.total}",
			:at => [390,100], :height => 100, :width => 150, :style => :bold, :size => 12
		text_box "Sales Tax (0.0%)",
			:at => [390,80], :height => 100, :width => 150, :style => :bold, :size => 12
		text_box "Total: #{@invoice.total}",
			:at => [390,60], :height => 100, :width => 150, :style => :bold, :size => 12
		text_box "Payments/Credits",
			:at => [390,40], :height => 100, :width => 190, :style => :bold, :size => 12
		text_box "Balance Due: #{@invoice.total}",
			:at => [390,20], :height => 100, :width => 150, :style => :bold, :size => 12
	end

end
