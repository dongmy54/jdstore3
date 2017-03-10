class Account::OrdersController < ApplicationController
   before_action :authenticate_user!

   def index
   	   @orders = current_user.orders.order("id DESC")

   	   if params[:date].present?
   	   	d = Date.parse(params[:date])
   	   	@orders = @orders.where( :created_at => d.beginning_of_day..d.end_of_day)
   	   	
   	   end

   	   if params[:status].present?
   	   	@orders = @orders.where( :aasm_state => params[:status])
   	   end

   	   if params[:pending].present?
   	   	@orders = @orders.where(:aasm_state => ["paid","order_placed"])
   	   end

   	   if params[:ids].present?
   	   	 @orders = @orders.where( :id => params[:ids].split(","))
   	   end

   	   if params[:total].present?
   	   	 @orders = @orders.where( "total > ?",params[:total])
   	   end

   	   cookies[:dongmy] = 123456789
   	   session[:foobar] = "test"
   end


end
