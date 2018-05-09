class EstimatePdf < Prawn::Document
  require "open-uri"

  def initialize(estimate, view)
    super()
    @estimate = estimate
    @view = view
		if estimate.class.to_s == 'Estimate'
			#@invoice = @invoices
      #logo
			title
      user_info
      services
			#bill_to
			#footer
		#else
		#	@invoices.each_with_index do |invoice, i|
		#		@invoice = invoice
    #		logo
		#		title
		#		bill_to
		#		services
		#		footer
		#		start_new_page unless i == @invoices.length-1
		#	end
		end
  end

	def logo
    image open("http://pandera.ml/images/pandera_app/grassHopperLogo.png"), :width => 240, :height => 80
  end

	def title
		sa = ShippingAddress.where("is_default IS TRUE").first
    text_box sa.name, style: :bold,
     :at => [150,720], :height => 100, :width => 300, :style => :bold, :size => 30
    text_box "Proudly contributing for a nicer community",
     :at => [180,680], :height => 100, :width => 500, :style => :bold, :size => 10
    text_box "AGREEMENT FORM",
     :at => [205,660], :height => 100, :width => 400, :style => :bold, :size => 15
	end

	def user_info
    e = @estimate
    #text e.client.name, style: :bold
    text_box e.client.name,
     :at => [60,600]
    text_box e.client.phone[0..2] + '    ' + e.client.phone[3..5]+ '    ' + e.client.phone[6..e.client.phone.length-1],
     :at => [403,600]
		text_box 'Name: ____________________________________________ Phone: (       )_____-_______',
     :at => [20,600]
    text_box e.client.street_address,
     :at => [75,570]
    text_box Date.today.strftime("%d/%m/%Y"),
     :at => [410,570]
    text_box 'Address: _____________________________________________ Date: ________________',
     :at => [20,570]
    text_box e.client.city,
     :at => [55,540]
    text_box e.client.state,
     :at => [270,540]
    text_box e.client.zipcode,
     :at => [430,540]
    text_box 'City: __________________________ State: _____________________ Zip: _____________',
     :at => [20,540]
    text_box e.client.email,
     :at => [70,510]
    text_box 'Email: ____________________________________________________________________',
     :at => [20,510]
	end

	def services
    text_box "SERVICE          AMOUNT $          SERVICE          AMOUNT $", style: :bold,
     :at => [70,480], :height => 100, :width => 500, :style => :bold, :size => 15
    stroke_axis

    stroke_color "000000"
    stroke_circle [10, 455], 8
    fill_color "DCDCDF"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 465], 150, 30
    fill_and_stroke_rectangle [175, 465], 85, 30
    stroke_color "000000"
    stroke_circle [270, 455], 8
    fill_color "DCDCDF"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 465], 110, 30
    fill_and_stroke_rectangle [400, 465], 85, 30

    stroke_color "000000"
    stroke_circle [10, 430], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 440], 150, 30
    fill_and_stroke_rectangle [175, 440], 85, 30
    stroke_color "000000"
    stroke_circle [270, 430], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 440], 110, 30
    fill_and_stroke_rectangle [400, 440], 85, 30

    stroke_color "000000"
    stroke_circle [10, 405], 8
    fill_color "DCDCDF"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 415], 150, 30
    fill_and_stroke_rectangle [175, 415], 85, 30
    stroke_color "000000"
    stroke_circle [270, 405], 8
    fill_color "DCDCDF"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 415], 110, 30
    fill_and_stroke_rectangle [400, 415], 85, 30

    stroke_color "000000"
    stroke_circle [10, 380], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 390], 150, 30
    fill_and_stroke_rectangle [175, 390], 85, 30
    stroke_color "000000"
    stroke_circle [270, 380], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 390], 110, 30
    fill_and_stroke_rectangle [400, 390], 85, 30

    stroke_color "000000"
    stroke_circle [10, 355], 8
    fill_color "DCDCDF"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 365], 150, 30
    fill_and_stroke_rectangle [175, 365], 85, 30
    stroke_color "000000"
    stroke_circle [270, 355], 8
    fill_color "DCDCDF"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 365], 110, 30
    fill_and_stroke_rectangle [400, 365], 85, 30

    stroke_color "000000"
    stroke_circle [10, 330], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 345], 150, 30
    fill_and_stroke_rectangle [175, 345], 85, 30
    stroke_color "000000"
    stroke_circle [270, 330], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 345], 110, 30
    fill_and_stroke_rectangle [400, 345], 85, 30

    stroke_color "000000"
    stroke_circle [10, 305], 8
    fill_color "DCDCDF"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 320], 150, 30
    fill_and_stroke_rectangle [175, 320], 85, 30
    stroke_color "000000"
    stroke_circle [270, 305], 8
    fill_color "DCDCDF"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 320], 110, 30
    fill_and_stroke_rectangle [400, 320], 85, 30

    stroke_color "000000"
    stroke_circle [10, 280], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 295], 150, 30
    fill_and_stroke_rectangle [175, 295], 85, 30
    stroke_color "000000"
    stroke_circle [270, 280], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 295], 110, 30
    fill_and_stroke_rectangle [400, 295], 85, 30

    stroke_color "000000"
    stroke_circle [10, 255], 8
    fill_color "DCDCDF"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 270], 150, 30
    fill_and_stroke_rectangle [175, 270], 85, 30
    stroke_color "000000"
    stroke_circle [270, 255], 8
    fill_color "DCDCDF"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 270], 110, 30
    fill_and_stroke_rectangle [400, 270], 85, 30


#bounding_box([100, 300], :width => 300, :height => 200) do
# stroke_bounds
# stroke_circle [0, 0], 10
#end
	end

	def footer
    balance = @invoice.total
    balance += @invoice.client.credit if @invoice.client.credit
    balance = 0 if @invoice.paid == true
		sa = ShippingAddress.where("is_default IS TRUE").first
		text_box "Please make checks payable to: \n #{sa.name}",
			:at => [0,35], :height => 100, :width => 250, :size => 12
		text_box "Subtotal $#{@invoice.total}",
			:at => [390,100], :height => 100, :width => 150, :style => :bold, :size => 12
		text_box "Sales Tax (0.0%)",
			:at => [390,80], :height => 100, :width => 150, :style => :bold, :size => 12
		text_box "Total: $#{@invoice.total}",
			:at => [390,60], :height => 100, :width => 150, :style => :bold, :size => 12
		text_box "Payments/Credits $#{@invoice.client.credit}",
			:at => [390,40], :height => 100, :width => 190, :style => :bold, :size => 12
		text_box "Balance Due: $#{balance}",
			:at => [390,20], :height => 100, :width => 150, :style => :bold, :size => 12
	end

end
