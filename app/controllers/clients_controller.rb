class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new, :create, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.includes(:services).where('prospect = ? OR prospect IS ?', false, nil).search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 10, :page => params[:page])
    #@clients = Client.search(params[:search]).order("created_at DESC").paginate(:per_page => 15, :page => params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data Client.all.to_csv }
			#format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end

  # GET /prospects
  # GET /prospects.json
  def prospects
    @prospects = Client.includes(:services).where(prospect: true).search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 10, :page => params[:page])
    respond_to do |format|
      format.html
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    location = Geocoder.search(@client.street_address)
    if location && location[0]
      @client.lat = location[0].latitude
      @client.lng = location[0].longitude
    end

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_services
    services = params[:service]

    dates = [ services[:date1], services[:date2], services[:date3], services[:date4], services[:date5], services[:date6] ]
    services[:quantity].to_i.times do |i|
      s = Service.create(date: dates[i].to_date ,client_id: client_params[:id], description: services[:description], notes: services[:notes], price: services[:price])
    end
    respond_to do |format|
        format.js { redirect_to clients_path, notice: 'Services were successfully added.' }
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    location = Geocoder.search(@client.street_address)
    if location && location[0]
      @client.lat = location[0].latitude
      @client.lng = location[0].longitude
    end

    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def create_monthly_invoices
    @invoice_num = 0
    # Clients that need invoices
    @clients = Client.joins(:services).where("invoice_id IS NULL").uniq
    @clients.each do |client|
      invoice = Invoice.new(client_id: client.id, maturity: Date.today + 30, description: Date.today.strftime("%B").to_s + ' invoice')
      invoice.services = client.services.where("invoice_id IS NULL")
      invoice.save!
      InvoiceMailer.invoice_created(invoice).deliver_now if client.email.present?
      InvoiceSmsMailer.invoice_created(invoice).deliver_now if client.phone.present? && client.sms_gateway.present?
      invoice.services.each do |srvc|
        srvc.invoice_id = invoice.id
        srvc.save!
      end
      @invoice_num += 1
    end
  end

  def last_service_price
    @client = Client.find(params[:id])
    description = params[:description]
    last_price = @client.services.where(description: description).last.price if @client.services.where(description: description).last
    respond_to do |format|
      format.json { render :json => last_price }
    end
  end

  def last_service_prices_by_name_address
    client_name = params[:name_address][0..params[:name_address].index(' | ')-1]
    client_address = params[:name_address][params[:name_address].index(' | ')+3..params[:name_address].length-1]
    @client = Client.find_by_name_and_street_address(client_name, client_address)
    description = params[:description]
    last_price = @client.services.where(description: description).map(&:price) if @client.services.where(description: description).last
    Rails.logger.info '----------'
    Rails.logger.info @client.inspect
    Rails.logger.info description
    Rails.logger.info last_price
    respond_to do |format|
      format.json { render :json => last_price }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:id, :name, :street_address, :city, :state, :zipcode, :email, :email2, :phone, :phone2, :dob, :sms_gateway, :sms_gateway2, :notes, :credit, :prospect, :lat, :lng)
    end

    def sort_column
      Client.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
