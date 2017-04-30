class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new, :create, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.includes(:services).search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 10, :page => params[:page])
    #@clients = Client.search(params[:search]).order("created_at DESC").paginate(:per_page => 15, :page => params[:page])
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

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :street_address, :city, :state, :zipcode, :email, :phone, :dob, :sms_gateway, :notes, :credit)
    end

    def sort_column
      Client.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
