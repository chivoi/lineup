class RequestsController < ApplicationController
  before_action :set_gig, only: [:new]
  before_action :set_request, only: [:new, :approve, :decline, :show_ammended]
  before_action :set_received_request, only: [:approve, :decline]
  before_action :set_host, only: [:new]
  before_action :set_user_request, only: [:new, :show_ammended]

  def new
    @request = Request.create(user_id: current_user.id, gig_id: @gig.id, host_id: @gig.user_id)
  end

  def show
    @requested_gigs = current_user.requests.all
    requests = Request.all
    @requests_received = requests.where(host_id:current_user.id)
  end

  def show_approved
  end

  def show_declined
  end

  def approve
    @request.status = 1
    @request.save
    gig = @request.gig
    gig.filled = true
    gig.save 

    respond_to do |format|
      if @request.save && gig.save
        format.html {redirect_to user_requests_path, notice: "Request Approved" }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html {render :show, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def decline
    @request.status = 2
    @request.save
    gig = @request.gig
    gig.filled = false
    gig.save 
    redirect_to user_requests_path

    respond_to do |format|
      if @request.save && gig.save
        format.html {redirect_to user_requests_path, notice: "Request Declined" }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html {render :show, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_request
    @request = Request.where(gig_id:params[:id])
  end

  def request_params
    params.require(:request).permit(:user_id, :gig_id, :status, :message)
  end

  def set_user_request
    @request = current_user.requests.where(gig_id:params[:id])
    if @request == nil
      flash[:alert] = "You don't have permission to do that"
      redirect_to gigs_path
    end
  end

  def set_host
    @host = Gig.find(params[:id]).user.profile
  end

  def set_received_request
    @request = Request.find_by_host_id(current_user.id)
  end

  def set_gig
    @gig = Gig.find(params[:id])
  end

end
