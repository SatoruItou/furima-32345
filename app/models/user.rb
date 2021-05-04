class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と数字の両方を含めて設定してください',
                                 length: { minimum: 6 }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々一]+\z/ } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end
  with_options presence: true do
    validates :nickname
    validates :birth
  end
  has_many :items
  has_many :purchases
  has_many :sns_credentials

  def self.from_omniauth(auth)
   sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
   user = User.where(email: auth.info.email).first_or_initialize(
     nickname: auth.info.name,
        email: auth.info.email
   )
   if user.persisted?
    sns.user = user
    sns.save
   end
   { user: user, sns: sns }
  end
end
