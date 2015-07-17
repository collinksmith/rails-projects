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

require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
