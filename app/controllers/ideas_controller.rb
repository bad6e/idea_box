class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to @idea.category
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to @idea.category
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.delete
    redirect_to @idea.category
  end

  private
    def idea_params
      params.require(:idea).permit(:name, :description, :category_id)
    end
end
