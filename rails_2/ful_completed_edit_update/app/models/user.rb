class User < ApplicationRecord
  before_validation :ensure_session_token 
  validates :username, :session_token, presence: true, uniqueness: true 
  validates :password_digest, presence: true 
  validates :password, length: {minimum: 6}, allow_nil: true 

  has_many :goals

  def generate_session_token 
    SecureRandom::urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def reset_session_token! 
    self.session_token = generate_session_token
    self.save!
    self.session_token 
  end

  def correct_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def password 
    @password 
  end
  
  def password=(pw)
    @password = pw 
    self.password_digest = BCrypt::Password.create(pw)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username) 

    if user && user.correct_password?(password)
      user 
    else 
      nil 
    end
  end
end
