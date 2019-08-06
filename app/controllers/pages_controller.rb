class PagesController < ApplicationController


    def index
        if logged_in?
            redirect_to new_transaction_path
        end
        
    end

end