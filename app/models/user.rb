class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: /\A[\p{Hiragana}\p{Katakana}\p{Han}ー]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[\p{Hiragana}\p{Katakana}\p{Han}ー]+\z/ }
  validates :family_name_kana, presence: true, format: { with: /\A[\p{Katakana}ー]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{Katakana}ー]+\z/ }
  validates :birth_day, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
