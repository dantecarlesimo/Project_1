class User < ActiveRecord::Base

  has_secure_password 

  before_save { |user| user.email = email.downcase } #makes email lower case before save
  before_save :create_remember_token #

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :scenarios

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end  

end
