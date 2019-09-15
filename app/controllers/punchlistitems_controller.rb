class PunchlistitemsController < ApplicationController
    before_action :set_jobpunchlist
    before_action :set_punchlistitem, except: [:create]


    def create
        @punchlistitem = @jobpunchlist.punchlistitems.create(punchlistitem_params)
        redirect_to @jobpunchlist
    end

    def destroy
        @punchlistitem = @jobpunchlist.punchlistitems.find(params[:id])
        if @punchlistitem.destroy
         flash[:success] = "Todo List item was deleted."
        else
         flash[:error] = "Todo List item could not be deleted."
        end
        redirect_to @jobpunchlist 
    end

    def complete
        @punchlistitem.update_attribute(:completed_at, Time.now)
        redirect_to @jobpunchlist, notice: "Todo item completed"
    end
    
    private
    
    def set_jobpunchlist
        @jobpunchlist = Jobpunchlist.find(params[:jobpunchlist_id])
    end

    def set_punchlistitem
        @punchlistitem = @jobpunchlist.punchlistitems.find(params[:id])
    end

    def punchlistitem_params
        params[:punchlistitem].permit(:content)
    end
end
