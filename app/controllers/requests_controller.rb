class RequestsController < ApplicationController

  def new
    Request.create(user_id: buyer_id, listing_id: listing_id, payment_intent: payment_intent_id, receipt_url: payment.charges.data[0].receipt_url)
  end

end
