class Usuario < ActiveRecord::Base
  before_save { email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nome, presence: true, length: { maximum: 50 }
  validates :email, presence: true,
                      length: { maximum: 50 },
                      format: { with: VALID_EMAIL_REGEX },
                  uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 4 }
end
