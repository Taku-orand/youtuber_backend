class User < ApplicationRecord
  #新規登録時passwordとpassword_confirmationの2つを入力
  has_secure_password

  has_many :favorites, dependent: :destroy
  has_many :youtubers

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
