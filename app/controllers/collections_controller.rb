class CollectionsController < ApplicationController
	before_action :authenticate_user!
	protect_from_forgery prepend: true

	def index
		@products = current_user.products
	end

	def destroy
	@collection = current_user.collections.find_by(product_id: params[:id])
	@collection.destroy

	flash[:warnig] = "成功将#{}从收藏夹删除！"
	redirect_to :back
end

end
