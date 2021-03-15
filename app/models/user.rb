class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と数字の両方を含めて設定してください',
                                 length: { minimum: 6 }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々一]+\z/ } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/ } do
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true
  end
  with_options presence: true do
  validates :nickname
  validates :birth
  end
end
