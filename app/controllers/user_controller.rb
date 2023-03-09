class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    user.update
    redirect_to users_path(params.id)
  end

  def index
    
  end
  
   private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :introduction, :profile_image)  
  end
  
end
