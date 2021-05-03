# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :username, uniqueness: true, presence: true
    validates :password_digest, :session_token, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}
    after_initialize :ensure_session_token

    attr_reader :password
    #spire

    has_many :subs,
    foreign_key: :moderator_id,
    class_name: :Sub

    has_many :posts,
    foreign_key: :author_id,
    class_name: :Post

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)

        if user && user.is_password?(password)
            user
        else
            nil
        end

    end

    def password=(pw)
        self.password_digest = BCrypt::Password.create(pw)
        @password = pw

    end

    def is_password?(pw)
        BCrypt::Password.new(self.password_digest).is_password?(pw)

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
