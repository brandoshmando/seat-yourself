class SessionsController < ApplicationController

  #  before_action :no_login, only: [:new]

  # def no_login
  #   redirect_to root_path if current_customer
  # end

  def new
  end

  def create
  	@customer = Customer.find_by_email(params[:email])
  	if @customer && @customer.authenticate(params[:password])
      session[:customer_id] = @customer.id
  		redirect_to customer_path(@customer.id), :notice => "Logged In"
  	else
  		flash.now[:alert] = "Invalid Email or Password!"
  		render "new"
  	end
  end

  def destroy
  	session[:customer_id] = nil
  	redirect_to new_session_path, :notice => "Logged Out!"
  end
end