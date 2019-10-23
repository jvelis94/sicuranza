class ContractorsController < ApplicationController
    before_action :set_contractor, only: [:show, :edit, :update, :destroy]
            
    def index
        if params[:query].present?
            sql_query = "name ILIKE :query OR address1 ILIKE :query OR city ILIKE :query OR CAST(phone AS text) ILIKE :query OR CAST(zip AS text) ILIKE :query"
            @contractors = Contractor.where(sql_query, query: "%#{params[:query]}%")
        else
            @contractors = Contractor.all
        end
    end

    def show
        @contractor = Contractor.find(params[:id])
    end

    def new
        @contractor = Contractor.new
        
    end

    def create
        @contractor = Contractor.new(contractor_params)
        respond_to do |format|
            if @contractor.save
                format.html { redirect_to contractors_path, notice: 'Contractor was successfully created.' }
            else
                format.html { render action: 'new'}
            end
        end
    end

    def edit
    end

    def update
        @contractor.update(contractor_params)
        redirect_to contractor_path(@contractor)
    end

    def destroy
        @contractor.destroy
    end

    def options
    end

    def delete_file_attachment
        @contractor_file = ActiveStorage::Attachment.find(params[:id])
        @contractor_file.purge
        redirect_back(fallback_location: contractor_path)

      end
    

    private

    def contractor_params
        params.require(:contractor).permit(:name, :address1, :city, :state, :zip, :phone, :notes, files: [], blueprints: [])
    end

    def set_contractor
        @contractor = Contractor.find(params[:id])
    end
end
