class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i#メールアドレスの正規表現（定数）
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },#formatというオプションを指定
                    uniqueness: { case_sensitive: false }#メールアドレスの一意性を検証する,大文字小文字を無視する case_sensitiveオプション
end