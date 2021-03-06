class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :birth_date
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい' } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい' } do
      validates :last_name_kana
      validates :first_name_kana
    end
    PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'パスワードには半角英字と半角数字の両方を含めて設定してください'
  end
  has_many :items
  has_many :purchases
end
