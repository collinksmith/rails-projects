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

require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
