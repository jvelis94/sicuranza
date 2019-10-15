class WorkOrdersController < ApplicationController
    before_action :set_work_order, only: [:show, :edit, :update, :destroy]
            
    def index
        if params[:query].present?
            sql_query = "customer_name ILIKE :query OR technician ILIKE :query OR location ILIKE :query OR CAST(date AS text) ILIKE :query OR CAST(id AS text) ILIKE :query"
            @work_orders = WorkOrder.where(sql_query, query: "%#{params[:query]}%")
            @invoices = Invoice.all
        else
            @work_orders = WorkOrder.all
            @invoices = Invoice.all
        end
    end

    def show
        @work_order = WorkOrder.find(params[:id])
    end

    def new
        @work_order = WorkOrder.new
        
    end

    def create
        @work_order = WorkOrder.new(work_order_params)
        @work_order.user = current_user
        respond_to do |format|
            if @work_order.save
                format.html { redirect_to work_orders_path, notice: 'Work Order was successfully created.' }
            else
                format.html { render action: 'new'}
            end
        end
    end

    def edit
    end

    def update
        @work_order.update(work_order_params)
    end

    def destroy
        @work_order.destroy
    end
    
    def options
    end

    private

    def work_order_params
        params.require(:work_order).permit(:technician, :date, :location, :hours, :customer_name, :customer_street_address, :customer_city, :state, :customer_zip_code, :customer_phone_number, :customer_email, :job_details)
    end

    def set_work_order
        @work_order = WorkOrder.find(params[:id])
    end
end
