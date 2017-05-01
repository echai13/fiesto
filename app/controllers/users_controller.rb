class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :drop]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def new
    #prevents user from accessing signup when already logged in
    begin
      @user = User.find(session[:user_id])
      redirect_to @user
    rescue ActiveRecord::RecordNotFound
      @user = User.new
    end
  end

  def index
    #admins only page
    if User.find(session[:user_id]).admin?
      @users = User.paginate(page: params[:page])
    else
      redirect_to root_path
    end
  end

  #profile page
  def show
     @user = User.find(params[:id])
  end

  #edit page
  def edit
    @user = User.find(params[:id])
  end

  #updating profile
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #drop parties
  def drop
    if params[:id]
      Party.existing(current_user.id,params[:id]).first.destroy
      flash[:success] = "Sucessfully Dropped!"
      redirect_to current_user
    end
  end

  #signup page
  def create
   @user = User.new(user_params)
   @user.update_attribute(:radius, 5)
   if @user.save
     Stripe.api_key = "sk_test_e3a2WOvBkQpgRrufKzprhHhn"
     customer = Stripe::Customer.create(email: @user.email)
     @user.update_attribute(:customer_id, customer.id)
     #defaults to 5 mile radius
     log_in @user
     flash[:success] = "Welcome to the Fiesto!"
     redirect_to @user
   else
     render 'new'
   end
 end

 #user deletion by admin
 def destroy
   Party.user_deletion(params[:id]).each do |temp|
     temp.destroy
   end
   Event.user_deletion(params[:id]).each do |temp|
     temp.destroy
   end
   User.find(params[:id]).destroy
   flash[:success] = "User deleted"
   redirect_to users_url
 end

 private

   def user_params
     params.require(:user).permit(:username, :email, :password,
                                  :password_confirmation, :radius)
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

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
