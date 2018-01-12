class ProductsController < ApplicationController
	def index
		@products = Product.all
	end
	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		flash[:notice] = 'thanh cong'
		return redirect_to products_path if @product.save
		flash.now[:notice] ='ko thanh cong'
		render :new
	end
	def edit
		@product = Product.find(params[:id])

		render :new
	end
	def update
		@product =Product.find(params[:id])
		if @product.update(product_params)
					return redirect_to products_path
				else flash.now[:notice] ='ko thanh cong'
					render :new
		end
		
	end
	private
	def product_params
		params.require(:product).permit(:title, :description, :price, :published, :category_id, :level)
		
	end
end