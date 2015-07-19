# == Schema Information
#
# Table name: pets
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  animal_type :string(255)      not null
#  sex         :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Pet < ActiveRecord::Base
  validates :name, :animal_type, :sex, presence: true

  has_many(
    :follows,
    foreign_key: :pet_id,
    class_name: :PetFollow
  )

  has_many :users, through: :follows, source: :user
end
