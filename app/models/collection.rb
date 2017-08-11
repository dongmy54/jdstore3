class Collection < ApplicationRecord
	belongs_to :user, counter_cache: true
	belongs_to :product
end
