# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  song_number :integer
#  album_id    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  song_type   :string
#  lyrics      :text
#

class Track < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :album
  has_many(
    :notes,
    class_name: :Note,
    foreign_key: :track_id
  )
end
