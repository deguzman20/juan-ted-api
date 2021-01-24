class Customer::ReportController < ApplicationController
  def index
  end

  def new
    @report =  Report.new
  end

  def message; end

  def create
    @report = Report.new
    @report.customer_id = params[:report][:customer_id].to_i
    @report.tasker_id = params[:report][:tasker_id].to_i
    @report.image = params[:report][:image]
    @report.save
    if @report.save
    else
      render :new
    end
  end

end
