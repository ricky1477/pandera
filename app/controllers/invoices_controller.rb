class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new, :create, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    #@invoices = Invoice.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 15, :page => params[:page])
    @invoices = Invoice.search(params[:search]).order("created_at DESC").paginate(:per_page => 10, :page => params[:page])
    if params[:overdue]
      @invoices = @invoices.where('? > maturity', Date.today).where('paid IS NOT TRUE')
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = InvoicePdf.new(@invoice, view_context)
        send_data pdf.render, filename:
        "invoice_#{@invoice.created_at.strftime("%d/%m/%Y")}.pdf",
        type: "application/pdf",
				disposition: "inline"
      end
    end
  end

  def show_all
    @invoices = Invoice.where("paid IS NOT TRUE")
		respond_to do |format|
      format.html
      format.pdf do
        pdf = InvoicePdf.new(@invoices, view_context)
        send_data pdf.render, filename:
        "all_unpaid_invoices.pdf",
        type: "application/pdf",
				disposition: "inline"
      end
    end
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  def payment_reminder
    @invoice = Invoice.find(params[:id])
    InvoiceMailer.invoice_reminder(@invoice).deliver_now if @invoice.client.email.present?
    InvoiceSmsMailer.invoice_reminder(@invoice).deliver_now if @invoice.client.phone.present? && @invoice.client.sms_gateway.present?
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    respond_to do |format|
      if @invoice.save
        InvoiceMailer.invoice_created(@invoice).deliver_now if @invoice.client.email.present?
        InvoiceSmsMailer.invoice_created(@invoice).deliver_now if @invoice.client.curated_phone.present?
        format.html { redirect_to invoice_path(@invoice.id, :format => :pdf), notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        @client_id = params[:invoice][:client_id]
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if params[:invoice][:paid] == '1'
        @invoice.services.each do |service|
          service.paid = true
          service.save!
        end
      end
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:client_id, :invoice_number, :maturity, :date_of_service, :description, :price, :total, :paid, :check_number)
    end

    def sort_column
      Invoice.column_names.include?(params[:sort]) ? params[:sort] : "invoice_number"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
