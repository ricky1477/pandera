class EstimatePdf < Prawn::Document
  require "open-uri"

  def initialize(estimate, view)
    super()
    @estimate = estimate
    @view = view
		if estimate.class.to_s == 'Estimate'
			title
      user_info
      services
      important_info
      signatures
      work_guarantee
			footer
		end
  end

	def logo
    image open("http://pandera.ml/images/pandera_app/grassHopperLogo.png"), :width => 240, :height => 80
  end

	def title
		sa = ShippingAddress.where("is_default IS TRUE").first
    fill_color "1e7b1e"
    title_length = sa.name.length
    text_box sa.name,
     :at => [150-((title_length-15)*7),720], :height => 100, :width => 800, :style => :bold, :size => 30
    text_box "Proudly contributing for a nicer community",
     :at => [180,680], :height => 100, :width => 500, :style => :bold, :size => 10
    text_box "AGREEMENT FORM",
     :at => [205,660], :height => 100, :width => 400, :style => :bold, :size => 15
	end

	def user_info
    e = @estimate
    fill_color "000000"
    unless e.client.name.nil? || e.client.name.empty?
      text_box e.client.name,
       :at => [60,600]
    end
    unless e.client.phone.nil? || e.client.phone.empty?
      text_box e.client.phone[0..2] + '    ' + e.client.phone[3..5]+ '    ' + e.client.phone[6..e.client.phone.length-1],
      :at => [403,600]
    end
    fill_color "1e7b1e"
    text_box 'Name: ____________________________________________ Phone: (       )_____-______',
     :at => [20,600]
    fill_color "000000"
    unless e.client.street_address.nil? || e.client.street_address.empty?
      text_box e.client.street_address,
       :at => [75,570]
    end
    text_box Date.today.strftime("%d/%m/%Y"),
     :at => [410,570]
    fill_color "1e7b1e"
      text_box 'Address: _____________________________________________ Date: _______________',
       :at => [20,570]
    fill_color "000000"
    unless e.client.city.nil? || e.client.city.empty?
      text_box e.client.city,
       :at => [55,540]
    end
    unless e.client.state.nil? || e.client.state.empty?
      text_box e.client.state,
       :at => [270,540]
    end
    unless e.client.zipcode.nil? || e.client.zipcode.empty?
      text_box e.client.zipcode,
       :at => [430,540]
    end
    fill_color "1e7b1e"
    text_box 'City: __________________________ State: _____________________ Zip: ____________',
     :at => [20,540]
    fill_color "000000"
    unless e.client.email.nil? || e.client.email.empty?
      text_box e.client.email,
       :at => [70,510]
    end
    fill_color "1e7b1e"
    text_box 'Email: ___________________________________________________________________',
     :at => [20,510]
	end

	def services
    text_box "SERVICE          AMOUNT $          SERVICE               AMOUNT $", style: :bold,
     :at => [70,480], :height => 100, :width => 500, :style => :bold, :size => 15

    stroke_color "1e7b1e"
    stroke_circle [10, 455], 8
    fill_color "adebad"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 465], 150, 20
    fill_and_stroke_rectangle [175, 465], 87, 20
    stroke_color "1e7b1e"
    stroke_circle [275, 455], 8
    fill_color "adebad"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 465], 150, 20
    fill_and_stroke_rectangle [420, 465], 87, 20

    stroke_color "1e7b1e"
    stroke_circle [10, 430], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 440], 150, 20
    fill_and_stroke_rectangle [175, 440], 87, 20
    stroke_color "1e7b1e"
    stroke_circle [275, 430], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 440], 150, 20
    fill_and_stroke_rectangle [420, 440], 87, 20

    stroke_color "1e7b1e"
    stroke_circle [10, 405], 8
    fill_color "adebad"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 415], 150, 20
    fill_and_stroke_rectangle [175, 415], 87, 20
    stroke_color "1e7b1e"
    stroke_circle [275, 405], 8
    fill_color "adebad"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 415], 150, 20
    fill_and_stroke_rectangle [420, 415], 87, 20

    stroke_color "1e7b1e"
    stroke_circle [10, 380], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 390], 150, 20
    fill_and_stroke_rectangle [175, 390], 87, 20
    stroke_color "1e7b1e"
    stroke_circle [275, 380], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 390], 150, 20
    fill_and_stroke_rectangle [420, 390], 87, 20

    stroke_color "1e7b1e"
    stroke_circle [10, 355], 8
    fill_color "adebad"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 365], 150, 20
    fill_and_stroke_rectangle [175, 365], 87, 20
    stroke_color "1e7b1e"
    stroke_circle [275, 355], 8
    fill_color "adebad"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 365], 150, 20
    fill_and_stroke_rectangle [420, 365], 87, 20

    stroke_color "1e7b1e"
    stroke_circle [10, 330], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 340], 150, 20
    fill_and_stroke_rectangle [175, 340], 87, 20
    stroke_color "1e7b1e"
    stroke_circle [275, 330], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 340], 150, 20
    fill_and_stroke_rectangle [420, 340], 87, 20

    stroke_color "1e7b1e"
    stroke_circle [10, 305], 8
    fill_color "adebad"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 315], 150, 20
    fill_and_stroke_rectangle [175, 315], 87, 20
    stroke_color "1e7b1e"
    stroke_circle [275, 305], 8
    fill_color "adebad"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 315], 150, 20
    fill_and_stroke_rectangle [420, 315], 87, 20

    stroke_color "1e7b1e"
    stroke_circle [10, 280], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 290], 150, 20
    fill_and_stroke_rectangle [175, 290], 87, 20
    stroke_color "1e7b1e"
    stroke_circle [275, 280], 8
    fill_color "f2f2f2"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 290], 150, 20
    fill_and_stroke_rectangle [420, 290], 87, 20

    stroke_color "1e7b1e"
    stroke_circle [10, 255], 8
    fill_color "adebad"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [20, 265], 150, 20
    fill_and_stroke_rectangle [175, 265], 87, 20
    stroke_color "1e7b1e"
    stroke_circle [275, 255], 8
    fill_color "adebad"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [285, 265], 150, 20
    fill_and_stroke_rectangle [420, 265], 87, 20

    # Service text
    fill_color "1e7b1e"
    text_box "Lawn mowing (weekly)", style: :bold,
     :at => [23,460], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Spring clean-up", style: :bold,
     :at => [290,460], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Mulching", style: :bold,
     :at => [23,435], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Falls clean-up", style: :bold,
     :at => [290,435], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Core aeration", style: :bold,
     :at => [23,410], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Detaching", style: :bold,
     :at => [290,410], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Seeding", style: :bold,
     :at => [23,385], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Tree removal", style: :bold,
     :at => [290,385], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Fertilizing", style: :bold,
     :at => [23,360], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Stump removal", style: :bold,
     :at => [290,360], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Planting", style: :bold,
     :at => [23,335], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Pruning", style: :bold,
     :at => [290,335], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Bush trimming", style: :bold,
     :at => [23,310], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Snow removal", style: :bold,
     :at => [290,310], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Gutter cleaning", style: :bold,
     :at => [23,285], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Power wash", style: :bold,
     :at => [290,285], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Hauling", style: :bold,
     :at => [23,260], :height => 100, :width => 500, :style => :bold, :size => 13

    text_box "Other", style: :bold,
     :at => [290,260], :height => 100, :width => 500, :style => :bold, :size => 13

    # Total Box
    stroke_color "1e7b1e"
    fill_color "1e7b1e"
    text_box "TOTAL",
     :at => [340,238], :height => 100, :width => 500, :style => :bold, :size => 15
    fill_color "adebad"
    fill_color "ffffff"
    stroke_color "1e7b1e"
    fill_and_stroke_rectangle [420, 244], 86, 22
	end

  def important_info
    fill_color "1e7b1e"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [2, 220], 505, 87
    fill_color "FFFFFF"
    text_box 'Important Information:',
     :at => [5,215], :size => 10
    text_box 'Monthly service bills are due on the 1st of each month.  A late fee of $10.00 will be applied for payments after the due date.',
     :at => [5,200], :size => 9
    text_box 'Full payment is required.  When the account is late for two consecutive months, service will be interrupted.',
     :at => [5,190], :size => 9
    text_box 'For returned checks a fee of $25 will be applied.',
     :at => [5,180], :size => 9
    text_box 'Monthly service can be cancelled anytime by the customer within 15 days written notice, otherwise, a cancel fee of $100.00',
     :at => [5,170], :size => 9
    text_box 'will be applied.',
     :at => [5,160], :size => 9
    text_box 'By signing this agreement the customer agrees with all the payments, fees and cancellation conditions.',
     :at => [5,150], :size => 9
  end

  def signatures
    fill_color "1e7b1e"
    text_box '_________________________                   _________________________',
     :at => [50,112]
    text_box 'Manager',
    :at => [100,100], :style => :bold, :size => 13
    text_box 'Customer',
    :at => [340,100], :style => :bold, :size => 13
  end

  def work_guarantee
    text_box 'Our work is guaranteed and',
    :at => [170,80]
    text_box 'your satisfaction is very important to us.',
    :at => [140,70]
    text_box 'We look forward to serving your family for a long time!',
    :at => [110,60]
  end

	def footer
    sa = ShippingAddress.where("is_default IS TRUE").first
    fill_color "1e7b1e"
    stroke_color "FFFFFF"
    fill_and_stroke_rectangle [2, 50], 505, 50
    fill_color "FFFFFF"
    text_box sa.street,
     :at => [10,45] , :size => 15
    text_box sa.phone,
     :at => [390,45] , :size => 17
    text_box sa.city + ', ' + sa.state + ' ' + sa.zipcode,
     :at => [10,20] , :size => 15
    email_length = sa.email.length
    text_box sa.email,
     :at => [390-((email_length-15)*5.3),20] , :size => 13
	end

end
