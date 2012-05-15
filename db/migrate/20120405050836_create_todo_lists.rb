class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
