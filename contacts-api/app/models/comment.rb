class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :author_id, presence: true
  validates :commentable_id, presence: true
  validates :commentable_type, presence: true

  belongs_to :commentable, polymorphic: :true

  belongs_to(
    :author,
    class_name: :User,
    primary_key: :id,
    foreign_key: :author
    )
end
