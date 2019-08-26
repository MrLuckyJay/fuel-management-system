class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [ :login,:new,:create]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @current_user = current_user
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @current_user = current_user

  end

  # GET /users/new
  def new
    if logged_in?
      redirect_to new_transaction_path
    else
      @user = User.new
    end
  end

  # GET /users/1/edit
  def edit
    @current_user = current_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

   
      if @user.save
        session[:user_id] = @user.id
       redirect_to new_transaction_path
       flash[:success] = 'User was successfully created.' 
        
      else
      render :new 
      flash[:danger]='errors prohibited the user from been created'
      end
   
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
  
      if @user.update(user_params)
        redirect_to @user
        flash[:success] = 'User was successfully updated.' 
        
      else
       render :edit
        flash[:danger] = 'Errors Prohibited the Update process'
      end
    
    @current_user = current_user
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    
      redirect_to users_url
      flash[:danger] = 'User was successfully destroyed.' 
      
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :profile_pic)
    end
end
