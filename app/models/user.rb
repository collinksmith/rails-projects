class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many(
    :contacts,
    class_name: :Contact,
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :comments, as: :commentable

  has_many :contact_shares, dependent: :destroy

  has_many :shared_contacts, through: :contact_shares, source: :contact

  has_many :user_groupings

  has_many :groups, through: :user_groupings, source: :group

  has_many :group_contacts, through: :groups, source: :contacts




  has_many(
    :authored_comments,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :author_id
    )
end
