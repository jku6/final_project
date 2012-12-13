class UsersController < ApplicationController
  # before_filter :ensure_logged_in
  

  def new
    @user = User.new
  end

  def create
      @user = User.new(params[:user])

      if @user.save

        redirect_to edit_user_path(@user)

      else
        render :new
      end
  end

  def login
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to dashboard_index_path(user)
        else
            render :new #this is the new.html.erb page
        end
    end

  # def show
  #     user_id = params[:id]
  #     @user = User.find(user_id)
  # end

  def edit
    @user = User.find(params[:id])  
  end

  def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        session[:user_id] = @user.id
        redirect_to dashboard_index_path(@user) 
      else
        render :edit
      end
  end




  def destroy
      user = User.find(params[:id])
      user.delete
      redirect_to user
  end

  # private
  # def ensure_logged_in
  #      redirect_to root_path if @auth.nil?
  #  end
end