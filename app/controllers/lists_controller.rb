class ListsController < ApplicationController
    before_action :set_list, only: [ :show, :edit, :update, :destroy ]

def index
    @lists = List.all
    @tasks = List.tasks
end

def show
end

def new
    @list = List.new
end

def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, success: 'Список успешно создан'
    else
      @lists = List.all.order(:title)
      flash[:danger] = 'Список не создан'
      render :new
    end
end

def edit
end

def update
    if @list.update(list_params)
        redirect_to @list
    else
        render :edit
    end
end

def destroy
    @list.destroy
    redirect_to lists_path, success: 'Список успешно удален'
end

private

def set_list
    @list = List.find(params[:id])
end

def list_params
    params.require(:list).permit(:title)
end
end
