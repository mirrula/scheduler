class TasksController < ApplicationController
  before_action :user_logged_in, only: %i[index create general done]

  def index
    @tasks = current_user.tasks
    @new_task = current_user.tasks.build
  end

  def general
    @tasks = current_user.general_tasks
    @new_task = current_user.tasks.build
  end

  def done
    @tasks = current_user.done_tasks
    @new_task = current_user.tasks.build
  end

  def create
    @tasks = Task.create(tasks_params)
    if @tasks.errors.any?
      flash[:error] = @tasks.errors.full_messages
    else
      @tasks.save
    end
    if params[:task][:list_id] == ''
      redirect_to tasks_path
    else
      redirect_to list_path(params[:task][:list_id])
    end
  end

  def toggle
    task = Task.find(params[:id])
    task.status = !task.status
    task.save
    redirect_to tasks_done_path
  end

  private

  def tasks_params
    param = params.require(:task).permit(:name, :description, :expiring_date, :list_id)
    param.delete(:list_id) if param[:list_id] == ''
    param[:author_id] = current_user.id
    param
  end
end
