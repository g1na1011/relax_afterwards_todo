class AddStatusToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :status
  end
end
