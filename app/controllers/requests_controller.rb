class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
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

end
