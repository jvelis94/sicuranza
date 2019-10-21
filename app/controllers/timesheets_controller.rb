class TimesheetsController < ApplicationController
    before_action :set_timesheet, only: [:show, :edit, :update, :destroy]
            
    def index
        @timesheets = Timesheet.all
        respond_to do |format|
            format.html
            format.pdf do
                render pdf: "Timesheet",
                page_size: 'A4',
                template: "timesheets/index.html.erb",
                layout: "pdf.html",
                orientation: "Portrait",
                lowquality: true,
                zoom: 1,
                dpi: 75
            end
        end
    end

    def show
        @timesheet = Timesheet.find(params[:id])
    end

#    new method will be in home controller

    def create
        @timesheet = Timesheet.new(timesheet_params)
        @timesheet.week_start = (Date.parse(params[:timesheet]["week_start(1i)"]+params[:timesheet]["week_start(2i)"]+params[:timesheet]["week_start(3i)"])).beginning_of_week
        @timesheet.week_end = (Date.parse(params[:timesheet]["week_start(1i)"]+params[:timesheet]["week_start(2i)"]+params[:timesheet]["week_start(3i)"])).end_of_week
        @timesheet.user = current_user
        respond_to do |format|
            if @timesheet.save
                format.html { redirect_to authenticated_root_path, notice: 'timesheet was successfully created.' }
            else
                format.html { render action: 'new'}
            end
        end
    end

    def edit
    end

    def update
        @timesheet.update(timesheet_params)
    end

    def destroy
        @timesheet.destroy
        respond_to do |format|
            format.html { redirect_to authenticated_root_path, notice: 'timesheet was successfully destroyed.' }
            format.json { head :no_content }
          end
    end

    def hours_worked_this_week
        @timesheets = Timesheet.all
        hours_worked = 0
        @timesheets.map do |timesheet|
            if timesheet.week_start === (Time.now).beginning_of_week
                hours_worked += timesheet.hours_worked_today
            end
        end
        return hours_worked
    end

    private

    def timesheet_params
        params.require(:timesheet).permit(:today, :week_start, :week_end, :hours_worked_today, :hours_worked_week, :notes)
    end

    def set_timesheet
        @timesheet = Timesheet.find(params[:id])
    end
end
