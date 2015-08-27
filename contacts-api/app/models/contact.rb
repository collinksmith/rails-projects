class Contact < ActiveRecord::Base
  validates :user_id, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: {scope: :user_id}

  belongs_to(
    :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many :contact_groupings
  has_many :groups, through: :contact_groupings, source: :group
  has_many :group_users, through: :groups, source: :users

  has_many :comments, as: :commentable
  has_many :contact_shares

  has_many :shared_users, through: :contact_shares, source: :user
end
