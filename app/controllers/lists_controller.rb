class ListsController < ApplicationController
  before_action :user_logged_in, only: %i[show index]

  def index
    @user = current_user
    @lists = current_user.lists.order(name: :asc)
    @new_list = current_user.lists.build
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

  def list_params
    params.require(:list).permit(:name, :icon)
  end
end
