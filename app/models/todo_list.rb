class TodoList < ActiveRecord::Base
  has_many :todo_items

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }

  def has_completed_items?
    todo_items.complete.size > 0
  end

  def has_incomplete_items?
    # Calling the incomplete scope ( in the TodoItem model) and making sure there's more than one item in it
    todo_items.incomplete.size > 0
  end
end
