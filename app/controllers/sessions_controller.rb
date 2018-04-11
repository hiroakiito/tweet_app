class SessionsController < ApplicationController
  def new
  end
  
  def create#ユーザーをデータベースから見つけて検証する
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])#「ユーザーがデータベースにあり、かつ、認証に成功した場合にのみ」
    else
       flash.now[:danger] = 'Invalid email/password combination' # 本当は正しくない
    render 'new'
    end
  end
  
  def destroy
  end
  
end