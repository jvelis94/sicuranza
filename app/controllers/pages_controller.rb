class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  


  def home
    @task = Task.new
    @tasks = Task.all
    @paid_invoices_sum = Invoice.where(paid: true, job_type: "Invoice").sum(:balance_remaining)
    @unpaid_invoices_sum = Invoice.where(paid: false, job_type: "Invoice").sum(:balance_remaining)
    @estimates_todo = EstimatesTodo.new
    @estimates_todos = EstimatesTodo.all
    @contractors = Contractor.all
    @timesheet = Timesheet.new
    @time = Time.now
    @weeks = Timesheet.where(user_id: current_user).group_by(&:week_start)
    @hours_worked_this_week = Timesheet.where(user_id: current_user, week_start: (Time.now).beginning_of_week).sum(:hours_worked_today)
  end

end
