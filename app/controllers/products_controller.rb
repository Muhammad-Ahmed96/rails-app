class ProductsController < ApplicationController
  def index
    if params[:q].present? and params[:q][:category].present?
      @products = Category.find(params[:q][:category]).products
      @selected_cat_dropdown = params[:q][:category]
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # @product.image.attach(product_params[:image])
    if @product.save
  		flash[:notice] = "Product Saved Successfully"
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

  def add_to_cart
    purchase = Purchase.new(user_id: current_user.id, product_id: params[:id])
    if purchase.save!
      flash[:notice] = "Product added to cart successfully"
    else
      flash[:alert] = "Error adding product to cart"
    end
    redirect_to products_path
  end

  private
  def product_params
  	params.require(:product).permit(:name,:product_image,:description,:price,:category_id)
  end
end
