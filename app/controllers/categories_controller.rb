class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = current_user.categories.all
  end

  def show
    redirect_to "categories/#{task_path}"
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.create(category_params)
    @category.save

    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    redirect_to categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
