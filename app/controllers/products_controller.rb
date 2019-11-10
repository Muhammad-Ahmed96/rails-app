class ProductsController < ApplicationController
	def index
  	@products = Product.all
  end

  def show
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		flash[:notice] = "Product Save Successfully"
  		redirect_to products_path
    else
  		flash[:alert] = "Error saving the product"
  		render 'new'
  	end
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def product_params
  	params.require(:product).permit(:name,:image,:description,:price,:category_id)
  end
end
