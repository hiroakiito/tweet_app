class AddIndexToUsersEmail < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :email, unique: true#メールアドレスの一意性を強制するためのマイグレーション
  end
end
