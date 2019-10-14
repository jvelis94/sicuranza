class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  
  def home
    @task = Task.new
    @tasks = Task.all
  end
  
end
