class CartsController < ApplicationController

def index
  @cart_items = current_cart.cart_items.includes(:product => :photos)
end

def clean
	current_cart.clean!
	redirect_to carts_path
	flash[:warning] = "已清空购物车"
end

def checkout
	@order = Order.new
end


end
