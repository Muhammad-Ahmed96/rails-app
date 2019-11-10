class CategoriesController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :is_admin, except: [:show]
  def index
  end

  def show
  end

  def new
		@category = Category.new
	end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
