class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # 保存の成功をここで扱う。
    else
      render 'new'
    end
  end

  private

    def user_params#createアクションでStrong Parametersを使う
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end