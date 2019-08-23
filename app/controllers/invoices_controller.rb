class InvoicesController < ApplicationController
    before_action :set_invoice, only: [:show, :edit, :update, :destroy]
    

            
    def index
        @invoices = Invoice.all        
    end

    def show
        @invoice = Invoice.find(params[:id])
        # @work_order = WorkOrder.find(params[:work_order_id])
        # @invoice.work_order = @work_order
        # @invoice.save
        respond_to do |format|
            format.html
            format.pdf do
                render pdf: "Invoice No. #{@invoice.work_order_id}",
                page_size: 'A4',
                template: "invoices/show.html.erb",
                layout: "pdf.html",
                orientation: "Portrait",
                lowquality: true,
                zoom: 1,
                dpi: 75
            end
        end
    end

    def new
        @work_order = WorkOrder.find(params[:work_order_id])
        @invoice = Invoice.new
        @invoice.work_order = @work_order
    end

    def create
        @work_order = WorkOrder.find(params[:work_order_id])
        @invoice = Invoice.new(invoice_params)
        @invoice.total = @invoice.subtotal + @invoice.tax
        @invoice.balance_remaining = @invoice.total + @invoice.payments_credits
        @invoice.work_order = @work_order
        respond_to do |format|
            if @invoice.save
                # mail = UserMailer.with(invoice: @invoice).invoice
                # mail.deliver_now
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
        params.require(:invoice).permit(:bill_to_info, :project_name, :description, :amount, :description2, :amount2,:description3, :amount3, :description4, :amount4, :description5, :amount5, :description6, :amount6, :description7, :amount7, :date, :job_date, :subtotal, :tax, :total, :payments_credits, :balance_remaining)
    end

    def set_invoice
        @invoice = Invoice.find(params[:id])
    end

    
end
