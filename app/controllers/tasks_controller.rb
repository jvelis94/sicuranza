class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
            
    def index
        @tasks = Task.all
    end

    def show
        @task = Task.find(params[:id])
    end

#    new method will be in home controller

    def create
        @task = Task.new(task_params)
        @task.user = current_user
        respond_to do |format|
            if @task.save
                format.html { redirect_to authenticated_root_path, notice: 'Task was successfully created.' }
            else
                format.html { render action: 'new'}
            end
        end
    end

    def edit
    end

    def update
        @task.update(task_params)
    end

    def destroy
        @task.destroy
        respond_to do |format|
            format.html { redirect_to authenticated_root_path, notice: 'Task was successfully destroyed.' }
            format.json { head :no_content }
          end
    end
    
    def done
        @task = Task.find(params[:id])
        @task.update_attribute(:status, 'done')
        redirect_to authenticated_root_path, notice: "Todo item completed"
    end

    def undo
        @task = Task.find(params[:id])
        @task.update_attribute(:status, 'not done')
        redirect_to authenticated_root_path, notice: "Todo item undone"
    end

    private

    def task_params
        params.require(:task).permit(:name, :status)
    end

    def set_task
        @task = Task.find(params[:id])
    end
end
