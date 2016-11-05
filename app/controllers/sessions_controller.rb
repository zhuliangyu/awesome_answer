class SessionsController < ApplicationController


  def new

  end

  def create

    @user=find_user_by_email




    if user_exist? && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to root_path
    else
      flash[:alert]="username or password wrong"
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
  def downcase_email_params
    params[:email].downcase
  end

  def find_user_by_email
    @user||=User.where(email: downcase_email_params).first
  end


  def user_exist?
    @user.present?

  end




end
