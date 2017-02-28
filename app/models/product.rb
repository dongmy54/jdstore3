class Product < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :photos
    accepts_nested_attributes_for :photos
    has_many :comments

    # def add_product_to_collction(product)
    #    @collection = Collection.new
    #    @collection.user = current.user
    #    @collection.product = product
    # end
end
