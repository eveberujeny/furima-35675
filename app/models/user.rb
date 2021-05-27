class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :birthday, presence: true

  validates :first_name, presence: true,
                format: {
                  with: /\A[ぁ-んァ-ン一-龥]/,
                }
  
  validates :last_name, presence: true,
                format: {
                  with: /\A[ぁ-んァ-ン一-龥]/,
                }

  validates :name_reading, presence: true,
                 format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                 }
  validates :surname_reading, presence: true,
                 format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                 }
  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/
  validates :password, format: { with: VALID_PASSWORD_REGEX }          
  
end
