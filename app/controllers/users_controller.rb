class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new
    #prevents user from accessing signup when already logged in
    begin
      @user = User.find(session[:user_id])
      redirect_to @user
    rescue ActiveRecord::RecordNotFound
      @user = User.new
    end
  end

  def show
    #prevents users from using URLs to access other user's information
    begin
     @user = User.find(params[:id])
     if @user.id != session[:user_id]
       render 'error'
     end
    rescue ActiveRecord::RecordNotFound
      render 'error'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


  def create
   @user = User.new(user_params)
   if @user.save
     log_in @user
     flash[:success] = "Welcome to the Fiesto!"
     redirect_to @user
   else
     render 'new'
   end
 end

 private

   def user_params
     params.require(:user).permit(:username, :email, :password,
                                  :password_confirmation)
   end

   def logged_in_user
       unless logged_in?
         store_location
         flash[:danger] = "Please log in."
         redirect_to login_url
       end
   end

   # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
