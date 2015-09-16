class CategoriesController < ApplicationController
  before_action :load_category, only: [:show, :edit, :update, :destroy]

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
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.delete
    redirect_to categories_path
  end


  private
    def category_params
      params.require(:category).permit(:name)
    end

    def load_category
      @category = Category.find(params[:id])
    end
end
