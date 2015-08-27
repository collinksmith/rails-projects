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

require 'test_helper'

class PetFollowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
