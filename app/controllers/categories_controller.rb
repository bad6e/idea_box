class CategoriesController < ApplicationController
  before_action :load_category, only: [:show, :new]

  def index
    @categories = Category.all
  end

  def show
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def load_category
      @category = Category.find(params[:id])
    end
end
