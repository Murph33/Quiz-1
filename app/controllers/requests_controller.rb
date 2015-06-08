class RequestsController < ApplicationController

  def index
    @requests = Request.order("done desc")
  end

  def new
    @request = Request.new
  end

  def show
    @request = Request.find params[:id]
  end

  def create
    request_params = params.require(:request).permit(:name, :email, :department, :message)
    @request = Request.new request_params
    if @request.save
      redirect_to requests_path
    else
      flash[:alert] = "Failed to create.  Please correct errors"
      render :new
    end
  end

  def edit
    @request = Request.find params[:id]
  end

  def update
    request_params = params.require(:request).permit(:name, :email, :department, :message)
    @request = Request.find params[:id]
    if @request.update request_params
      redirect_to request_path(@request), notice: "Request Updated"
    else
      render :edit
    end
  end

  def destroy
    @request = Request.find params[:id]
    @request.destroy
    redirect_to requests_path, notice: "Request Removed"
  end

  def done_toggle
    @request = Request.find params[:id]
    if @request.done == "Done"
      @request.done = "Not Done"
      @request.save
    else @request.done = "Done"
      @request.save
    end
    redirect_to requests_path
  end

  def search
    render text: params.inspect
  end

end
