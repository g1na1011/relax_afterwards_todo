class TodosController < ApplicationController
  def index
    @todo_items = Todo.all
    @todo_item = Todo.new
  end

  def create
    @todo_item = Todo.new(todo_params)

    if @todo_item.save
      redirect_to root_path
    else
      flash[:error] = "Please enter an item."
      redirect_to root_path
    end
  end

  def destroy
    @last_todo_item = Todo.last
    @last_todo_item.delete
    redirect_to root_path
  end

  def complete
    params[:todos_checkbox].each do |check|
      todo_id = check
      t = Todo.find_by_id(todo_id)
      t.update_attribute(:completed, true)
    end
    redirect_to root_path
  end

  private

  def todo_params
    params.require(:todo).permit(:todo_item, :completed)
  end
end