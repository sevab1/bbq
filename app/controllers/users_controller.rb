class UsersController < ApplicationController
  before_action :set_current_user, except: [:show]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: I18n.t('controllers.users.updated')
    else
      render :edit
    end
  end

  private

  def set_current_user
    @user = current_user
  end

  # Пользователь может меня только свое имя, email и аватар
  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
