class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #半角英数字での入力必須
  PASSWORD_REGEX =  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  #全角ひらがなカタカナ漢字での入力必須
  NAME_REGEX =      /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  #全角カタカナでの入力必須
  NAME_RUBY_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :encrypted_password, format: { with: PASSWORD_REGEX, message: "Password Include both letters and numbers" }
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: NAME_REGEX, message: "Last name Full-width characters" }
  validates :first_name, presence: true, format: { with: NAME_REGEX, message: "First name Full-width characters" }
  validates :last_name_ruby, presence: true, format: { with: NAME_RUBY_REGEX, message: "Last name Full-width katakana characters" }
  validates :first_name_ruby, presence: true, format: { with: NAME_RUBY_REGEX, message: "First name Full-width katakana characters" }
  validates :birth_day, presence: true
end
