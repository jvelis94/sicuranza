class InvoicesController < ApplicationController
    before_action :set_invoice, only: [:show, :edit, :update, :destroy]
    

            
    def index
        if params[:query].present?
            sql_query = "project_name ILIKE :query OR bill_to_info ILIKE :query OR CAST(job_date AS text) ILIKE :query OR CAST(id AS text) ILIKE :query OR CAST(balance_remaining AS text) ILIKE :query"
            @invoices = Invoice.where(sql_query, query: "%#{params[:query]}%")
        else
            @invoices = Invoice.all
        end
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
        1.times { @invoice.details.build }
        @invoice.work_order = @work_order
    end

    def create
        @work_order = WorkOrder.find(params[:work_order_id])
        @invoice = Invoice.new(invoice_params)
        @invoice.subtotal = @invoice.details.map(&:amount).reduce(:+)
        @invoice.total = @invoice.subtotal * (1 + @invoice.tax)
        @invoice.balance_remaining = @invoice.total + @invoice.payments_credits
        @invoice.work_order = @work_order
        respond_to do |format|
            if @invoice.save
                format.html { redirect_to invoices_path, notice: 'Invoice was successfully created.' }
            else
                format.html { render action: 'new'}
            end
        end
    end

    def edit
    end

    def update
        @invoice.update(invoice_params)
            @invoice.subtotal = @invoice.details.map(&:amount).reduce(:+)
            @invoice.total = @invoice.subtotal * (1 + @invoice.tax)
            @invoice.balance_remaining = @invoice.total - @invoice.payments_credits
         if @invoice.update(invoice_params)
            flash[:success] = "Product was successfully updated"
          else
            render 'edit'
          end
          redirect_to invoices_path
    end

    def destroy
        @invoice.destroy
    end

    def paid
        if params[:query].present?
            sql_query = "project_name ILIKE :query OR bill_to_info ILIKE :query OR CAST(job_date AS text) ILIKE :query OR CAST(id AS text) ILIKE :query OR CAST(balance_remaining AS text) ILIKE :query"
            @invoices = Invoice.where(sql_query, query: "%#{params[:query]}%")
        else
            @invoices = Invoice.all
        end
    end

    def unpaid
        if params[:query].present?
            sql_query = "project_name ILIKE :query OR bill_to_info ILIKE :query OR CAST(job_date AS text) ILIKE :query OR CAST(id AS text) ILIKE :query OR CAST(balance_remaining AS text) ILIKE :query"
            @invoices = Invoice.where(sql_query, query: "%#{params[:query]}%")
        else
            @invoices = Invoice.all
        end
    end

    def estimates
        if params[:query].present?
            sql_query = "project_name ILIKE :query OR bill_to_info ILIKE :query OR CAST(job_date AS text) ILIKE :query OR CAST(id AS text) ILIKE :query OR CAST(balance_remaining AS text) ILIKE :query"
            @invoices = Invoice.where(sql_query, query: "%#{params[:query]}%")
        else
            @invoices = Invoice.all
        end
    end
    

    private

    def invoice_params
        params.require(:invoice).permit(:bill_to_info, :project_name, :date, :job_date, :subtotal, :tax, :total, :payments_credits, :balance_remaining, :paid, :notes, :job_type, :details_attributes => [:id, :description, :amount] )
    end

    def set_invoice
        @invoice = Invoice.find(params[:id])
    end

    
end
