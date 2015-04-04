class TodoList < ActiveRecord::Base
  has_may :todo_items

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }
end
