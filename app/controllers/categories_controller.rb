class CategoriesController < ApplicationController
  before_action :load_category, only: [:show, :new]

  def index
    @categories = Category.all
  end

  def show
    @cat = Category.find(params[:id])
    @category = @cat.ideas.where(user_id: current_user.id)
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def load_category
      @category = Category.find(params[:id])
    end
end
