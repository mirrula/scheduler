class TasksController < ApplicationController
    before_action :set_list, only: [ :show, :edit, :update, :destroy ]

def index
    @tasks = Task.all
    @@tasks = Task.all
end

def show
end

def new
    @task = Task.new
end

def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, success: 'Задача успешно создана'
    else
      @tasks = Task.all.order(:title)
      flash[:danger] = 'Задача не создана'
      render :new
    end
end

def edit
end

def update
    if @task.update(task_params)
        redirect_to @task
    else
        render :edit
    end
end

def destroy
    @task.destroy
    redirect_to tasks_path, success: 'Список успешно удален'
end

private

def set_task
    @task = Task.find(params[:id])
end

def task_params
    params.require(:task).permit(:body)
end

end
