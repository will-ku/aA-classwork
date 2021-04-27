class User < ApplicationRecord
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    after_initialize :ensure_session_token

    #SPIRE
    attr_reader :password

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return user if user && user.is_password?(password)
        nil
    end

    def generate_session_token
        token = SecureRandom::urlsafe_base64
    end

    def ensure_session_token
        self.session_token ||= generate_session_token
    end

    def reset_session_token!
        self.session_token = generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        self.password = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        password_obj = BCrypt::Password.create(self.password_digest)
        password_obj.is_password?(password)
    end

end
