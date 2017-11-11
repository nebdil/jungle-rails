class UsersController < ApplicationController
    def new
    end

    def create
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      elsif User.find_by(email: params[:user][:email])
        flash[:notice] = "Email is taken!"
        redirect_to '/signup'
      else
        flash[:notice] = "Something went wrong while signing up"
        redirect_to '/signup'
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
