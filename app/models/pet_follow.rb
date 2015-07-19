# == Schema Information
#
# Table name: pet_follows
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  pet_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class PetFollow < ActiveRecord::Base
  validates :user_id, :pet_id, presence: true
  validates :user_id, uniqueness: { scope: :pet_id }

  belongs_to(
    :pet,
    foreign_key: :pet_id,
    class_name: :Pet
  )

  belongs_to(
    :user,
    foreign_key: :user_id,
    class_name: :user
  )
end
