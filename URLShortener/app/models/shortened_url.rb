# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  long_url     :string
#  short_url    :string
#  submitter_id :integer
#

require 'securerandom'

class ShortenedUrl < ActiveRecord::Base
  validates :short_url, presence: :true, uniqueness: :true

  belongs_to(
    :user,
    foreign_key: :submitter_id,
    primary_key: :id,
    class_name: "User"
  )

  has_many(
    :visits,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: 'Visit'
  )

  has_many(
    :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor
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

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_unique
    self.visits.where("created_at > ?", 120.minutes.ago)
                      .select(:user_id).distinct.count
  end


end
