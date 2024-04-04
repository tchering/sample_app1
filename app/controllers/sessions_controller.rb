class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(email:params[:session][:email].downcase )
      if user && user.authenticate(params[:session][:password])
        #need to login user should be defined in helper
        log_in user
        redirect_to user
      else
        flash.now[:danger] = "Invalid email or password"
        render "new"
      end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
