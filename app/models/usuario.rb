class Usuario < ActiveRecord::Base
  validates :nome, presence: true
  validates :email, presence: true

end
