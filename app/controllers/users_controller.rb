class UsersController < ApplicationController

  def new
    @user=User.new
  end

  def create
    @user=User.new(get_user_params)
    if @user.save
      redirect_to root_path,notice: "You successfully register a new user!"
    else
      flash[:alert]=errors_message
      render :new

    end
  end

  private
  def get_user_params
    params.require(:user).permit(:name,:email,:password)
  end

  def errors_message
    @user.errors.full_messages.join(",")
  end

end
