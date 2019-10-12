class UsersController < ApplicationController 

    get '/signup' do 
        if logged_in?
            redirect '/items' 
        else 
            erb :'/users/signup' 
        end
    end 

    post '/signup' do 
        if params[:username] == "" || params[:password] == ""
            redirect '/signup' 
        else 
            user = User.create(username: params[:username], password: params[:password])
            redirect '/items' 
        end 
    end 

end 