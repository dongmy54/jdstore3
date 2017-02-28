class ProductsController < ApplicationController
 before_action :validate_search_key, only: [:search]
 def index
 	@products = Product.all
 end

 def show
 	@product = Product.find(params[:id])
 	@photos = @product.photos.all
  @comments = @product.comments.all
 end

  def add_to_cart
  	@product = Product.find(params[:id])
  	if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你成功将 #{@product.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
  redirect_to :back
  end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 5 )
    end
  end

  def bgs
    @products = Product.where(:category => "办公室").paginate(:page => params[:page], :per_page => 5)
  end

  def kt
    @products = Product.where(:category => "客厅").paginate(:page => params[:page], :per_page => 5)
  end

  def cc
    @products = Product.where(:category => "餐厨").paginate(:page => params[:page], :per_page => 5)
  end

  def ws
    @products = Product.where(:category => "卧室").paginate(:page => params[:page], :per_page => 5)
  end

  def zmhdzcp
    @products = Product.where(:category => "照明和电子产品").paginate(:page => params[:page], :per_page => 5)
  end

  def pj
    @products = Product.where(:category => "配件").paginate(:page => params[:page], :per_page => 5)
  end

  def collect
    @product = Product.find(params[:id])
    @collection = Collection.new
       @collection.user = current_user
       @collection.product_id = @product
       if @collection.save
         flash[:notice] = "已添加宝贝到收藏夹"
         redirect_to :back
       end
  end


  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :title_cont => query_string }
  end
end
