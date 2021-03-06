class UsersController < ApplicationController


  def index
    @user = current_user
  end


  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :profile, :image)
    end

end
