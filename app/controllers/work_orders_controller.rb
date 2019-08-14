class WorkOrdersController < ApplicationController
    before_action :set_work_order, only: [:show, :edit, :update, :destroy]
            
    def index
        @work_orders = WorkOrder.all        
    end

    def show
        @work_order = WorkOrder.find(params[:id])
    end

    def new
        @work_order = WorkOrder.new
    end

    def create
        WorkOrder.create(work_order_params)
    end

    def edit
    end

    def update
        @work_order.update(work_order_params)
    end

    def destroy
        @work_order.destroy
    end
    

    private

    def work_order_params
        params.require(:work_order).permit(:technician, :date, :location, :hours, :customer_name, :customer_street_address, :customer_city, :customer_zip_code, :customer_phone_number, :customer_email, :job_details)
    end

    def set_work_order
        @work_order = WorkOrder.find(params[:id])
    end
end
