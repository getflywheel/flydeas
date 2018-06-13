class LoginsController < ApplicationController
  def new
    @user = User.new 
  end
  def create
    #binding.pry
    #puts '------------------------------------------------------------'
    #puts params[:user]
    @user = User.new(params[:user])
    #@user.update_attributes(params[:user]), permit(:username, :password, :email, :salt) )
    @user.encrypt_password
    puts "hi"
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
