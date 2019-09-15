class ContractorsController < ApplicationController
    before_action :set_contractor, only: [:show, :edit, :update, :destroy]
            
    def index
        @contractors = Contractor.all
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
                format.html { redirect_to root_path, notice: 'Contractor was successfully created.' }
            else
                format.html { render action: 'new'}
            end
        end
    end

    def edit
    end

    def update
        @contractor.update(contractor_params)
    end

    def destroy
        @contractor.destroy
    end

    def options
    end
    

    private

    def contractor_params
        params.require(:contractor).permit(:name, :address1, :city, :state, :zip, :phone, files: [])
    end

    def set_contractor
        @contractor = Contractor.find(params[:id])
    end
end
