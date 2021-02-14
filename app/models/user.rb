class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  # 半角英数字での入力必須
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # 全角ひらがなカタカナ漢字での入力必須
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  # 全角カタカナでの入力必須
  NAME_RUBY_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' }
  with_options presence: true do
    validates :nickname
    with_options format: { with: NAME_REGEX, message: 'Full-width characters' } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: NAME_RUBY_REGEX, message: 'Full-width katakana characters' } do
      validates :last_name_ruby
      validates :first_name_ruby
    end
    validates :birth_day
  end

end
