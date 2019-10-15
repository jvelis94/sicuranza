class EstimatesTodosController < ApplicationController
    before_action :set_estimates_todo, only: [:show, :edit, :update, :destroy]
            
    def index
        @estimates_todos = EstimatesTodo.all
    end

    def show
        @estimates_todo = EstimatesTodo.find(params[:id])
    end

#    new method will be in home controller

    def create
        @estimates_todo = EstimatesTodo.new(estimates_todo_params)
        @estimates_todo.user = current_user
        respond_to do |format|
            if @estimates_todo.save
                format.html { redirect_to authenticated_root_path, notice: 'estimate_todo was successfully created.' }
            else
                format.html { render action: 'new'}
            end
        end
    end

    def edit
    end

    def update
        @estimates_todo.update(estimates_todo_params)
    end

    def destroy
        @estimates_todo.destroy
        respond_to do |format|
            format.html { redirect_to authenticated_root_path, notice: 'Estimates was successfully destroyed.' }
            format.json { head :no_content }
          end
    end
    
    def done
        @estimates_todo = EstimatesTodo.find(params[:id])
        @estimates_todo.update_attribute(:status, 'done')
        redirect_to authenticated_root_path, notice: "Todo item completed"
    end

    private

    def estimates_todo_params
        params.require(:estimates_todo).permit(:client, :project, :blueprint_email_date, :status)
    end

    def set_estimates_todo
        @estimates_todo = EstimatesTodo.find(params[:id])
    end
end
