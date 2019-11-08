class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success
    end

    def webhook
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)

        Purchase.create(
            user_id: payment.metadata.user_id,
            listing_id: payment.metadata.listing_id,
            purchase_id: payment_id
        )
    end
end