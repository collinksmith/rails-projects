# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  year           :string
#  band_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  recording_type :string
#

class Album < ActiveRecord::Base
  validates :name, :band_id, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy

end
