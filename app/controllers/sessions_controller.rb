class SessionsController < ApplicationController
    
    def new
        redirect_to transactions_path if logged_in? 
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id]= user.id
            #flah[:success]="Wecome #{user.username}"
            redirect_to new_transaction_path

        else
            #flah.now[:danger]="User Name or password Incorrect"
            redirect_to root_path

        end
    end

    def destroy
        session[:user_id]= nil
        #flah[:success]="You have successfully been loged out"
        redirect_to root_path

    end

end