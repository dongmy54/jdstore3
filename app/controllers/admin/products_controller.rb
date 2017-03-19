class Admin::ProductsController < AdminController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  
  def index
  	@products = Product.all.includes(:photos)
  end

  def show
    @photos = @product.photos.all
  end

  def new
  	@product = Product.new
    @photo = @product.photos.build
  end

  def create
  	@product = Product.new(product_params)

  	if @product.save
  		if  params[:photos] != nil
          params[:photos]['image'].each do |a|
          @photo = @product.photos.create(:image => a)
        end
      end
          redirect_to admin_products_path 

    else
  		render :new
  	end
  end


  def edit
  end

  def update


  	if params[:photos] != nil
      @product.photos.destroy_all
      params[:photos]['image'].each do |a|
        @picture = @product.photos.create(:image => a)
      end
      @product.update(product_params)
      redirect_to admin_products_path

    elsif @product.update(product_params)
      redirect_to admin_products_path
  	else
  		render :edit
  	end
  end

  def destroy
    @product.destroy
    flash[:alert] = "Product deleted"
    redirect_to admin_products_path
  end

  private

  def product_params
  	params.require(:product).permit(:title, :description, :quantity, :price, :image, :category)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
