class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user.present?
      session[:user_id] = @user.id
      redirect_to tasks_url
    else
      @user = User.new
      flash.now[:alert] = "User with the given email doesn't exist"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
