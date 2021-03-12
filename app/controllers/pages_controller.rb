class PagesController < ApplicationController
  def home
  end

  def payment_success
    session = Stripe::Checkout::Session.retrieve(params[:session_id])
    customer = Stripe::Customer.retrieve(session.customer)
    email = customer[:email]
    @purchase = Donation.find_by_email(email)
  end
end
