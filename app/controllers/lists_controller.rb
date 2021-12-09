class ListsController < ApplicationController
  before_action :user_logged_in, only: %i[show index]
  before_action :set_list, except: %i[index new create]

  def index
    @user = current_user
    @lists = current_user.lists.order(name: :asc)
    @new_list = current_user.lists.build
  end

  def destroy
    @list.tasks.clear
    @list.destroy
    redirect_to lists_path, success: 'list has been deleted'
  end
    
  def create
    current_user.lists.create!(list_params)
    redirect_to app_path
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks.where('status = false')
    @new_task = current_user.tasks.build
  end

  private
  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :icon)
  end
end
