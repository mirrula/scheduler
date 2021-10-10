class TasksController < ApplicationController

def index
end

def show
end

def new
    @task = Task.new
end

def create
end

def edit
end

def destroy
end

private

def set_task
    @task = Task.find(params[:id])
end

def task_params
    params.require(:task).permit(:title, :body, :is_complete, :creation_date, :deadline)
end

end
