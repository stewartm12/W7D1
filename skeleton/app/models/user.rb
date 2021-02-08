class User < ApplicationRecord
  validates :user_name, :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true 

  before_validation :ensure_session_token

  def reset_session_token!
    self.session_token ||= SecureRandom::urlsafe_base64
    self.save! 
    self.session_token 
  end

  def ensure_session_token 
    self.session_token ||= SecureRandom::urlsafe_base64
  end
  

  def password=(password)
    @password = password 
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    password_object = BCrypt::Password.new(self.password_digest)
    password_object.is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    if user && user.is_password?(password)
      return user
    else  
      return nil 
    end
  end

end
