class CategoriesController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :is_admin, except: [:show]
  def index
    @categories = Category.all
  end

  def show
  end

  def new
		@category = Category.new
	end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Save Successfully..."
      redirect_to categories_path
    else
      flash[:alert] = "Error saving the category..."
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:name,:description)
  end
end
