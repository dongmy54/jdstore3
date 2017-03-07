class CartItemsController < ApplicationController
def destroy
	@cart = current_cart
	@cart_item = @cart.cart_items.find_by(product_id: params[:id])
	@product = @cart_item.product
	@cart_item.destroy

	flash[:warnig] = "成功将#{@product.title}从购物车删除！"
	redirect_to :back
end


def update
	@cart = current_cart
	@cart_item = @cart.cart_items.find_by(product_id: params[:id])
	
	if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
	@cart_item.update(cart_item_params)
    flash[:notice] = "成功变更数量"
else
	flash[:warning] = "数量不足以加入购物车"
end
	redirect_to carts_path
end

def remove_quantity
	cart_item = current_cart.cart_items.find_by(product_id: params[:id])
	if  cart_item.quantity != 0
		cart_item.quantity  -= 1
		cart_item.product.quantity += 1
		cart_item.product.save
		
		if cart_item.quantity == 0
			cart_item.destroy
			redirect_to carts_path
		else
    	cart_item.save
        redirect_to carts_path
        end
	end
	
    
end

def add_quantity
	   @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
	   if @cart_item.product.quantity != 0
		  @cart_item.quantity += 1
          @cart_item.product.quantity -=1
          @cart_item.product.save
	      @cart_item.save
          redirect_to carts_path
        else
          redirect_to carts_path
        flash[:warning] = "库存不足，火速备货中～"	
end
end



private

def cart_item_params
	params.require(:cart_item).permit(:quantity)	
end

end
