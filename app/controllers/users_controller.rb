class UsersController < ApplicationController
  def new
    @user = User.new
    #ower_idをrelationshipsに登録
    
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Rally!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update(user_params)
      redirect_to root_path , notice: 'ユーザー情報を編集しました'
    else
      render 'setting'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
