class RequestsController < ApplicationController

  def new
    @gig = Gig.find(params[:id])
    @request = Request.create(user_id: current_user.id, gig_id: @gig.id, host_id: @gig.user_id)
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:user_id, :gig_id, :status, :message)
  end

  def set_user_request
    @request = current_user.requests.find_by_id(params[:id])
    if @request == nil
      flash[:alert] = "You don't have permission to do that"
      redirect_to gigs_path
    end
  end

end
