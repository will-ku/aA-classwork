class User < ApplicationRecord
    validates :session_token, :password_digest, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, length: {minimum: 6}, allow_nil: true
    before_validation :ensure_session_token

    has_many :goals,
    foreign_key: :user_id,
    class_name: :Goal

    #spire
    attr_reader :password

    def self.find_by_credentials(username,password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            return user
        else
            return nil
        end
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        pw_ob = BCrypt::Password.new(password_digest)
        pw_ob.is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

end
