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

end
