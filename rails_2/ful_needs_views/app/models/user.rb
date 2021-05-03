class User < ApplicationRecord
  validates :username, :password_digest, presence: true 
  validates :username, uniqueness: true 
  validates :password, length: {minimum: 6}, allow_nil: true 
  before_validation :ensure_session_token 

  has_many :goals

  def generate_session_token 
    SecureRandom::urlsafe_base64
  end 

  def password=(password)
    @password = password 
    self.password_digest = BCrypt::Password.create(password)
  end

  attr_reader :password 

  def ensure_session_token 
    self.session_token ||= generate_session_token
  end

  def reset_session_token! 
    self.session_token = generate_session_token
    self.save!
    self.session_token 
  end

  def correct_password?(password)
    obj = BCrypt::Password.new(self.password_digest)
    obj.is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.correct_password?(password)
      return user 
    else 
      return nil 
    end
  end
end
