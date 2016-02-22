class LikesController < ApplicationController
  def create
    idea = Idea.find params[:idea_id]
    like = Like.new(idea: idea, user: current_user)

    if current_user == idea.user
      redirect_to root_path, alert: 'You cannot like your own ideas'
    else
      if like.save
        redirect_to ideas_path, notice: 'Liked'
      else
        redirect_to ideas_path, notice: "Not liked"
      end
    end
  end

  def destroy
    like = Like.find params[:id]
    like.destroy
    redirect_to ideas_path, notice: 'Unliked'
  end
end
