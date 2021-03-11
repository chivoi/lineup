class DonationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def new
  end

  def create
    @donation = Donation.new(donation_params)
  end

  def show
    stripe_session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      client_reference_id: current_user ? current_user.id : nil,
      customer_email: params[:email],
      line_items: [{
        amount: @listing.price * 100,
        name: @listing.title,
        description: @listing.description,
        currency: 'aud',
        quantity:1
      }],
        payment_intent_data: {
          metadata: {
          listing_id: @listing.id,
          user_id: current_user ? current_user.id : nil
          }
        },
        success_url: "#{root_url}payments/success?listingId=#{@listing.id}",
        cancel_url: "#{root_url}listings"
    )
    @session_id = stripe_session.id
    pp stripe_session
  end

  private

  def donation_params
    params.require(:donation).permit(:name, :email, :amount)
  end
end
