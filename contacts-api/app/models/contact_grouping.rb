class ContactGrouping < ActiveRecord::Base
  validates :contact_id, presence: true, uniqueness: {scope: :group_id}
  validates :group_id, presence: true

  belongs_to :group
  belongs_to :contact

end
