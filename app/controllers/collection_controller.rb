class CollectionController < ApplicationController
	def index
		@collections = Collection.all
	end
end
