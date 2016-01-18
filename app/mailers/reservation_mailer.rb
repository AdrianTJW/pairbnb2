class ReservationMailer < ApplicationMailer
	def booking_email(customer, host, reservation_id, booking, url)
		@customer = customer
		@host = host
		@reservation_id = reservation_id
		@booking = booking
		@url = url
		mail(to: @host, subject: "You have received a booking from #{@customer}!")
	end

	def customer_email(customer, host, reservation_id, booking, url)
		@customer = customer
		@host = host
		@reservation_id = reservation_id
		@booking = booking
		@url = url
		mail(to: @customer, subject: "You have made a booking at #{@booking}!")
	end
end
