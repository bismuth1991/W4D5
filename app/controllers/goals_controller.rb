class GoalsController < ApplicationController

  def create
    goal = Goal.new(goal_params)

    if goal.save
      redirect_to user_url(goal)
    else
      flash[:errors] = goal.errors.full_messages
      redirect_to new_user_goal_url
    end
  end

  def new
    render :new
  end

  def show
  end

  def destroy
  end

  private
  def goal_params
    params.require(:goal).permit(:user_id, :body, :public, :completed)
  end
end
