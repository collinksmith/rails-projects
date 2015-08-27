class UserGrouping < ActiveRecord::Base

  validates :user_id, presence: true, uniqueness: {scope: :group_id}
  validates :group_id, presence: true

  belongs_to :group
  belongs_to :user

end
