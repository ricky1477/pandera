class EstimatesController < ApplicationController
  before_action :set_estimate, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new, :create, :edit, :update, :destroy]

  # GET /estimates
  # GET /estimates.json
  def index
    @estimates = Estimate.all
    respond_to do |format|
      format.html
      format.csv { send_data Estimate.all.to_csv }
      #format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end

  # GET /estimates/1
  # GET /estimates/1.json
  def show
    @estimate = Estimate.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = EstimatePdf.new(@estimate, view_context)
        send_data pdf.render, filename:
        "estimate_#{@estimate.created_at.strftime("%d/%m/%Y")}.pdf",
        type: "application/pdf",
        disposition: "inline"
      end
    end
  end

  # GET /estimates/new
  def new
    @estimate = Estimate.new
  end

  # GET /estimates/1/edit
  def edit
  end

  # POST /estimates
  # POST /estimates.json
  def create
    @estimate = Estimate.new(estimate_params)

    respond_to do |format|
      if @estimate.save
        EstimateMailer.estimate_created(@estimate).deliver_now if @estimate.client.email.present?
        EstimateSmsMailer.estimate_created(@estimate).deliver_now if @estimate.client.phone.present? && @estimate.client.sms_gateway.present?
        format.html { redirect_to @estimate, notice: 'Estimate was successfully created.' }
        format.json { render :show, status: :created, location: @estimate }
      else
        @client_id = params[:service][:client_id]
        format.html { render :new }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estimates/1
  # PATCH/PUT /estimates/1.json
  def update
    respond_to do |format|
      if @estimate.update(estimate_params)
        format.html { redirect_to @estimate, notice: 'Estimate was successfully updated.' }
        format.json { render :show, status: :ok, location: @estimate }
      else
        format.html { render :edit }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimates/1
  # DELETE /estimates/1.json
  def destroy
    @estimate.destroy
    respond_to do |format|
      format.html { redirect_to estimates_url, notice: 'Estimate was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimate
      @estimate = Estimate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estimate_params
      params.require(:estimate).permit(:description, :price, :client_id, :notes)
    end
end
