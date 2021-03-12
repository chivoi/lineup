class DonationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def new
    @donation = Donation.new
  end

  private

  def donation_params
    params.require(:donation).permit(:name, :email, :amount, :payment_intent, :receipt_url)
  end
end
