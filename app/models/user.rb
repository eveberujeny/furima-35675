class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  
  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, } do
      validates :first_name
      validates :last_name
    end
  end

  with_options presence: true do
    with_options format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, } do
      validates :name_reading
      validates :surname_reading
    end
  end
  
  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/
  validates :password, format: { with: VALID_PASSWORD_REGEX }          
  
end
