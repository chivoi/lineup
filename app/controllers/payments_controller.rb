class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def webhook
    payment_intent_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_intent_id) 
    name = payment.metadata.name
    email = payment.metadata.email
    Donation.create(name: name, email: email, payment_intent: payment_intent_id, receipt_url: payment.charges.data[0].receipt_url)
  end

  def create_stripe_session
    stripe_session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      client_reference_id: current_user ? current_user.id : nil,
      customer_email: params[:email],
      line_items: [{
        name: "Donation to LineUp",
        amount: params[:amount].to_i * 100,
        currency: 'aud',
        quantity: 1
      }],
        payment_intent_data: {
          metadata: {
          name: params[:name],
          email: params[:email]
          }
        },
        success_url: "#{root_url}payments/success?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: "#{root_url}gigs"
    )

    render json: {sessionId: stripe_session.id }

  end
end