class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def webhook
    payment_intent_id =  params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_intent_id) 
    name = payment.metadata.name
    email = payment.metadata.email
    Donation.create(name: name, email: email, payment_intent: payment_intent_id, receipt_url: payment.charges.data[0].receipt_url)
  end
end