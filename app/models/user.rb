class User < ApplicationRecord
  before_save { self.email = email.downcase }#email属性を小文字に変換してメールアドレスの一意性を保証する.downcaseメソッドを使って小文字バージョンにしたもの.Userモデルの中では右式のselfを省略できる
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i#メールアドレスの正規表現（定数）
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },#formatというオプションを指定
                    uniqueness: { case_sensitive: false }#メールアドレスの一意性を検証する,大文字小文字を無視する case_sensitiveオプション
                    has_secure_password#Userモデルにhas_secure_passwordを追加する
end