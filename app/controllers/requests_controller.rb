class RequestsController < ApplicationController
  before_action :set_gig, only: [:new]
  before_action :set_request, only: [:approve, :decline]
  before_action :set_host, only: [:new]
  before_action :set_user_request, only: [:new, :show_ammended]

  def new
    @request = Request.create(user_id: current_user.id, gig_id: @gig.id, host_id: @gig.user_id)
    @host = User.find(@request.host_id)
    UserMailer.with(host: @host, gig: @gig).new_request_email(host: @host, gig: @gig).deliver_later
  end

  def show
    @requested_gigs = current_user.requests.all.includes(:user, :gig).includes(user: :profile).includes(gig: {image_attachment: :blob})
    @requests_received = Request.where(host_id:current_user.id).includes(:user, :gig).includes(user: :profile).includes(gig: {image_attachment: :blob})
  end

  def approve
    @request.accepted!
    puts @request.status_change
    gig = @request.gig
    gig.update(filled: true)

    respond_to do |format|
      if @request.status == "accepted"
        format.html {redirect_to user_requests_path, notice: "Request Approved" }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html {redirect_to user_requests_path, notice: "Something went wrong" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def decline
    @request.declined!
    gig = @request.gig
    gig.update(filled: false)

    respond_to do |format|
      if @request.status == "declined"
        format.html {redirect_to user_requests_path, notice: "Request Declined" }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html {redirect_to user_requests_path, notice: "Something went wrong" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
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
