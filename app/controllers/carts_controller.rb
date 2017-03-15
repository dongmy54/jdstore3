class CartsController < ApplicationController



def clean
	
	current_cart.clean!
	redirect_to carts_path
	flash[:warning] = "已清空购物车"
end

def checkout
	@order = Order.new
end


end
