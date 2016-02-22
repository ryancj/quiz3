class IdeasController < ApplicationController
before_action :find_idea, only: [:show, :edit, :update, :destroy]

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    if @idea.save
      redirect_to idea_path(@idea), notice: 'Idea Listed.'
    else

      render :new
    end
  end

  def show
    @idea = Idea.find params[:id]
  end

  def index
    @ideas = Idea.all
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to idea_path(@idea), notice: 'Idea Updated'
    else
      flash[:alert] = 'Check errors and try again.'
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path, notice: 'Idea Deleted'
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :description)
    end

    def find_idea
      @idea = Idea.find params[:id]
    end
end
