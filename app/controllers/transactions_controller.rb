class TransactionsController < ApplicationController

  def new
 		@reservation = Reservation.find(session[:reservation_id])
 		@price_int = @reservation.listing.price.scan(/\d/).join('').to_i
 		@price = (@reservation.enddate - @reservation.startdate).to_i * @price_int
  	@client_token = generate_client_token
  end

  def create
  	@reservation = Reservation.find(session[:reservation_id])
 		@price_int = @reservation.listing.price.scan(/\d/).join('').to_i
 		@price = (@reservation.enddate - @reservation.startdate).to_i * @price_int
  	unless current_user.has_payment_info?
	    @result = Braintree::Transaction.sale(
	              amount: @price,
	              payment_method_nonce: params[:payment_method_nonce],
	              customer: {
	              	first_name: params[:first_name],
	              	last_name: params[:last_name],
	              	email: current_user.email,
	              	phone: params[:phone]
	              },
	              options: {
	              	store_in_vault: true
	              })
	  else
	    @result = Braintree::Transaction.sale(
                amount: @price,
                payment_method_nonce: params[:payment_method_nonce])
	  end
    if @result.success?
      redirect_to root_url, notice: "Congratulations! Your transaction has been successfull!"
      session[:reservation_id] = nil
      @reservation.update(paid_status: "Paid")
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      @client_token = generate_client_token
      render :new
    end
  end

  private
	def generate_client_token
	  if current_user.has_payment_info?
	    Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
	  else
	    Braintree::ClientToken.generate
	  end
	end
end
