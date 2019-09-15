class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @work_order = WorkOrder.find(params[:work_order_id])
  end

  
end
