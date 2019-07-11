class Cart < ApplicationRecord
	has_many :cart_items
	belongs_to :user

	def total
		cart_items.inject(0) do |sum, item|
			sum + item.product.price
		end
	end

end