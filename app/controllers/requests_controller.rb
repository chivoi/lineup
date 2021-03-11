class RequestsController < ApplicationController
  before_action :set_gig, only: [:new]
  before_action :set_request, only: [:new]
  before_action :set_host, only: [:new]
  before_action :set_user_request, only: [:new]

  def new
    @gig.filled = true
    @gig.save
    @request = Request.create(user_id: current_user.id, gig_id: @gig.id, host_id: @gig.user_id)
  end

  def show
    @requested_gigs = current_user.requests.all
    requests = Request.all
    @requests_received = requests.where(host_id:current_user.id)
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

  def set_gig
    @gig = Gig.find(params[:id])
  end

end
