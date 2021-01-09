class Tasker::UploadController < ApplicationController
  def index
  end

  def new
    @upload =  Tasker.new
  end

  def message; end

  def create
    @upload = Tasker.new(upload_params)
    if @upload.save
      redirect_to upload_path(@upload)
    else
      render :new
    end
  end

  def edit
    @tasker = Tasker.find(params[:id])
  end

  def update
    @tasker = Tasker.find(params[:upload][:id])
    @tasker.image = params[:upload][:image]
    redirect_to '/tasker/upload/message/result' if @tasker.save
  end
end
