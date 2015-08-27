# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :datetime         not null
#  color       :string
#  name        :string           not null
#  sex         :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ActiveRecord::Base
  validates :name, :color, :sex, presence: true
  validate :good_color
  validate :good_sex

  has_many(
    :rental_requests,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: :CatRentalRequest,
    dependent: :destroy
  )
  def self.colors
    %w(black orange white grey)
  end

  def age
    elapsed_seconds = Time.now - birth_date
    elapsed_seconds/(365*24*60*60)
  end

  def birth_date
    return false unless attributes["birth_date"]
    attributes["birth_date"].strftime('%Y-%m-%d')
  end

  private
  def good_color
    unless self.class.colors.include?(color)
      errors[:color] << "Invalid color."
    end
  end

  def good_sex
    unless sex == 'm' || sex == 'f'
      errors[:sex] << "Sex must be 'm' or 'f'"
    end
  end
end
