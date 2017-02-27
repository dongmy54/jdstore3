class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
  	if !current_user.admin?
  		redirect_to "/", alert: "You are not admin."
  	end
  end

  helper_method :current_cart
  helper_method :is_commenter?

  def current_cart
  	  @current_cart ||= find_cart
  end

  def is_commenter?(comments)
     commenter = comments.find_by_commenter(current_user.email)
     if commenter.blank?
       return true
     else
      return false
     end
  end

  private

  def find_cart
  	 cart = Cart.find_by(id: session[:cart_id])
     if cart.blank?
     	cart = Cart.create
     end
     session[:cart_id] = cart.id
     return cart
  end
   
end
