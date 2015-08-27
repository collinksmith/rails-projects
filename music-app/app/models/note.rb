# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  text       :text             not null
#  user_id    :integer          not null
#  track_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ActiveRecord::Base
  validates :text, :user_id, :track_id, presence: true

  belongs_to(
    :user,
    class_name: :User,
    foreign_key: :user_id
  )

  belongs_to(
    :track,
    class_name: :Track,
    foreign_key: :track_id
  )
end
