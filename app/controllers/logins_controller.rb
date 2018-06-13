class LoginsController < ApplicationController
  def new
    @user = User.new 
  end

  def create
    @user = User.new(params[:user])
    @user.encrypt_password
    if @user.save
      flash[:notice] = "Woo you signed up"
      flash[:color] = "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color] = "invalid"
    end
    render "new"
  end

end
