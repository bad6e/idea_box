class IdeasController < ApplicationController

  def index
    @ideas = current_user.ideas.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      redirect_to category_path(idea_params[:category_id])
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to category_path(idea_params[:category_id])
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @category_id = @idea.category_id
    @idea.delete
    redirect_to category_path(@category_id)
  end

  private
    def idea_params
      params.require(:idea).permit(:name, :description, :category_id, :url_list)
    end
end
