class CollectionsController < ApplicationController
	before_action :authenticate_user!

	def index
		@products = current_user.products.includes(:photos)
	end

	def destroy
	 @collection = current_user.collections.find_by(product_id: params[:id])
	 @product = @collection.product
	 @collection.destroy
    
	flash[:warning] = "成功将#{@product.title}从收藏夹删除！"
	redirect_to :back
end

end
