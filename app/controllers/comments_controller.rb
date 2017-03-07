class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@product = Product.find(params[:product_id])
		@comment = Comment.new(comment_params)
		@comment.commenter = current_user.email
		@comment.product = @product
		if @comment.description.blank?
			flash[:warning] = "亲，留言不能为空哦！"
			redirect_to :back
	    else
		   if @comment.save
			   redirect_to :back
		   else
		    	render :new
		   end
		end
	end

	private

	def comment_params
    params.require(:comment).permit(:commenter, :description)
    end
end
