class RequestsController < ApplicationController
  before_action :find_request, only: [:edit, :update, :destroy, :show]
  def index
    @requests = Request.order("done desc")
  end

  def new
    @request = Request.new
  end

  def show
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
  end

  def update
    request_params = params.require(:request).permit(:name, :email, :department, :message)
    if @request.update request_params
      redirect_to request_path(@request), notice: "Request Updated"
    else
      render :edit
    end
  end

  def destroy
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
    @q = params.permit(:q)
    @requests = Request.where(["name ilike ? OR message ilike ? OR email ilike ? ", "%#{@q[:q]}%", "%#{@q[:q]}%", "%#{@q[:q]}%"]).paginate(:page => params[:page]).order("done desc")
  end

  def search2
    @q = params.permit(:q)
    @q = @q[:q]


  end

  private

  def find_request
    @request = Request.find params[:id]
  end

end
