class UsersController < ApplicationController
  #The new method is executed when user click signup button. In this case @user = User.new is creating a new, empty User object that is used to build the form. As we can see in our routes we have          get "/signup", to: "users#new"
  def new
    @user = User.new
    # debugger
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  #Here when user click submit button the create method is triggered.
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      #handle a successful save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      puts @user.errors.full_messages #for debug purpose
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def all
    @users = User.all
  end
end
