class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  
  def home
    @task = Task.new
    @tasks = Task.all
    @paid_invoices_sum = Invoice.where(paid: true, job_type: "Invoice").sum(:balance_remaining)
    @unpaid_invoices_sum = Invoice.where(paid: false, job_type: "Invoice").sum(:balance_remaining)
    @estimates_todo = EstimatesTodo.new
    @estimates_todos = EstimatesTodo.all
  end
  
end
