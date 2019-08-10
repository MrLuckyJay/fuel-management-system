class SessionsController < ApplicationController
    
    def new
        redirect_to transactions_path if logged_in? 
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id]= user.id
            redirect_to new_transaction_path
            flash[:success]="Wecome #{user.firstname } #{user.lastname}"

        else
            redirect_to login_path
            flash[:danger]="User Name or password Incorrect"

        end
    end

    def destroy
        session[:user_id]= nil
        redirect_to root_path
        flash[:success]="You have successfully been loged out"

    end

end