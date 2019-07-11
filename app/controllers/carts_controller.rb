class CartsController < ApplicationController
	before_action :authenticate_user!

	def index
		@cart = current_user.carts.last

		if @cart.nil?
			@cart = current_user.carts.create
		end

		@cart_items = @cart.cart_items
	end

	def add
		@cart = current_user.carts.last

		if @cart.nil?
			@cart = current_user.carts.create
		end

		@cart.cart_items.create(product_id: params[:product])
		redirect_to '/cart'
	end

	
end