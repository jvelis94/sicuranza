class InvoicesController < ApplicationController
    before_action :set_invoice, only: [:show, :edit, :update, :destroy]
            
    def index
        @invoices = Invoice.all        
    end

    def show
        @invoice = Invoice.find(params[:id])
    end

    def new
        @invoice = Invoice.new
    end

    def create
        Invoice.create(invoice_params)
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
