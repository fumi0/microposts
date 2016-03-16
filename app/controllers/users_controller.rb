class UsersController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update]

  def show 
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
    
    def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile update"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url if @user != current_user
  end
    
 private

  def user_params
    params.require(:user).permit(:name, :email, :password, :areas,
                                 :password_confirmation, )
  end
end
