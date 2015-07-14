class Group < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :user_groupings, dependent: :destroy
  has_many :contact_groupings, dependent: :destroy

  has_many :users, through: :user_groupings, source: :user
  has_many :contacts, through: :contact_groupings, source: :contact
end
