class IdeasController < ApplicationController
before_action :find_idea, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, except: [:index, :show]

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      redirect_to idea_path(@idea), notice: 'Idea Listed.'
    else
      render :new
    end
  end

  def show
    @idea = Idea.find params[:id]
    @comment = Comment.new
  end

  def index
    @ideas = Idea.all
    @like = @idea.like_for(current_user) if @like
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
