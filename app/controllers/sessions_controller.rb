class SessionsController < ApplicationController

  def new

  end

  def create

    if user_exist?
      @user=User.where(email: params[:email]).first
    end

    if user_exist? && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to root_path
    end


  end

  def destroy
    if user_sign_in?
      session[:user_id]=nil
      redirect_to root_path
    end


  end

  private
  def user_exist?
    User.where(email: params[:email]).present?

  end




end
