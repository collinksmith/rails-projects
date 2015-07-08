require 'securerandom'

class ShortenedUrl < ActiveRecord::Base
  validates :short_url, presence: :true, uniqueness: :true
  belongs_to(
    :user,
    foreign_key: :submitter_id,
    primary_key: :id,
    class_name: "User"
  )

  def self.random_code
    new_short_url = SecureRandom.base64(16)
    while ShortenedUrl.exists?(short_url: new_short_url)
      new_short_url = SecureRandom.base64(16)
    end

    new_short_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    self.create!(
      long_url: long_url,
      short_url: random_code,
      submitter_id: user.id
    )
  end




end
