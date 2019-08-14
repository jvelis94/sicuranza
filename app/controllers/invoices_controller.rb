class InvoicesController < ApplicationController
    before_action :set_invoice, only: [:show, :edit, :update, :destroy]
            
    def index
        @invoices = Invoice.all        
    end

    def show
        @invoice = Invoice.find(params[:id])
        @invoice.work_order = @work_order
        @invoice.save
    end

    def new
        @work_order = WorkOrder.find(params[:work_order_id])
        @invoice = Invoice.new
        @invoice.work_order = @work_order
    end

    def create
        @work_order = WorkOrder.find(params[:work_order_id])
        @invoice = Invoice.new(invoice_params)
        @invoice.work_order = @work_order
        respond_to do |format|
            if @invoice.save
                format.html { redirect_to root_path, notice: 'Invoice was successfully created.' }
            else
                format.html { render action: 'new'}
            end
        end
    end

    def edit
    end

    def update
        @invoice.update(invoice_params)
    end

    def destroy
        @invoice.destroy
    end
    

    private

    def invoice_params
        params.require(:invoice).permit(:bill_to_info, :description, :date, :job_date, :subtotal, :tax, :total, :payments_credits, :balance_remaining)
    end

    def set_invoice
        @invoice = Invoice.find(params[:id])
    end
end
