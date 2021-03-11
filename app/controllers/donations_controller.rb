class DonationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def new
  end

  def create
    
  end

  def webhook
    payment_intent_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_intent_id)
    email = payment.metadata.email
    name = payment.metadata.name
    Donation.create(email: email, name: name, payment_intent: payment_intent_id, receipt_url: payment.charges.data[0].receipt_url)
end
