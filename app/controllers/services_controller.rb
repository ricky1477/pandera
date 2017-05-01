class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new, :create, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    #@services = Service.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 15, :page => params[:page])
    @services = Service.includes(:client, :invoice).search(params[:search]).order("created_at DESC").order(sort_column + ' ' + sort_direction).paginate(:per_page => 15, :page => params[:page])
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        @client_id = params[:service][:client_id]
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    respond_to do |format|
        if @service.destroy
            format.html { redirect_to services_url, notice: 'Service was successfully deleted.' }
            format.json { head :no_content }
        else
            format.html { redirect_to services_url, notice: 'Service could not be deleted because it belongs to an invoice.' }
            format.json { render json: @service.errors, status: :unprocessable_entity }
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:date, :description, :maturity, :client_id, :paid, :invoice_id, :price)
    end
    def sort_column
      Service.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
