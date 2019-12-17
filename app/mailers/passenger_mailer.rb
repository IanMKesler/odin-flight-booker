class PassengerMailer < ApplicationMailer
    default from: 'thankyou@example.com'

    def thank_you_email
        @booking = params[:booking]
        @passenger = params[:passenger]
        @booking_url = bookings_url(@booking.id)
        mail(to: @passenger.email, subject: 'Thanks for booking your flight!')
    end
end
