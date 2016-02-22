class GroupsController < ApplicationController
  def create
    idea = Idea.find params[:idea_id]
    group = Group.new(idea: idea, user: current_user)

    if current_user == idea.user
      redirect_to root_path, alert: 'You cannot join your own idea'
    else
      if group.save
        redirect_to ideas_path, notice: 'Joined'
      else
        redirect_to ideas_path, notice: 'Not joined'
      end
    end
  end

  def destroy
    group = Group.find params[:id]
    group.destroy
    redirect_to ideas_path, notice: 'Un-joined'
  end
end
