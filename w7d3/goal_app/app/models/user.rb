class User < ApplicationRecord
    
    validates :username, presence: true, uniqueness: true
    validates :password, length: { minimum: 6, allow_nil: true }
    before_validation :ensure_session_token
    attr_reader :password

    has_many :goals,
        class_name: :Goal,
        foreign_key: :user_id

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password 
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            return user
        else
            return nil
        end
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
    
    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def is_password?(password)
        password_obj = BCrypt::Password.new(self.password_digest)
        password_obj.is_password?(password)
    end
end
