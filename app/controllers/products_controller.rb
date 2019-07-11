class ProductsController < ApplicationController

# http_basic_authenticate_with name: "wearenoobs", password: "12345" , except: [:index , :show]
	before_action :authenticate_user!
	

	def index
		@products = Product.all
	end

	def show 
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		 @product = Product.find(params[:id])
		 @product.update(product_params)

		 redirect_to product_path(@product)

	end

	def create
		product = Product.create(product_params)

		redirect_to product_path(product)
	end

	def destroy
		@product = Product.find(params[:id])

		@product.destroy

		redirect_to products_path
	end

	private

	def product_params
		params.require(:product).permit(:image , :name , :description, :price)	
	end
end