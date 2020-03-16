class PaymentController < ApplicationController

    def show
        payment = Payment.find(params[:paymenttype]);
        render json: { status: 'Success', message: 'show Payments By Type', data: payment }, status: :ok                 
    end

    def create 
        payment = Payment.new(payment_params)

        if payment.save 
            render json: { status: 'Success', message: 'Payment Saved'}, status: :ok
        else
            render json: { status: 'Error', message: 'Payment not Saved', data: payment.errors}, status: :unprocessable_entity
        end
    end


    private

    def payment_params
        params.permit(:name,:description, :amount, :discount, :durationType)
    end
end
