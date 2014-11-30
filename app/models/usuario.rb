class Usuario < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nome, presence: true, length: { maximum: 50 }
  validates :email, presence: true,
                      length: { maximum: 50 },
                      format: { with: VALID_EMAIL_REGEX },
                  uniqueness: true
end
