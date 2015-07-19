# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  counter         :integer          default(0)
#

class User < ActiveRecord::Base
  attr_reader :password

  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  before_validation :ensure_session_token

  has_many(
    :follows,
    foreign_key: :user_id,
    class_name: :PetFollow
  )

  has_many :pets, through: :follows, source: :pet

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    # no user with given username
    return nil if user.nil?

    # check user's password
    user.password_digest.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_digest
    BCrypt::Password.new(super)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
  end
end
