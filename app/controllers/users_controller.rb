class UsersController < ApplicationController 

    get '/signup' do 
        if logged_in?
            redirect "/items" 
        else 
            erb :'/users/signup' 
        end
    end 

    post '/signup' do 
        if params[:username] == "" || params[:password] == "" || !!existing_user?(params[:username]) 
            redirect "/signup" 
        else 
            user = User.create(username: params[:username], password: params[:password])
            session[:user_id] = user.id 
            redirect "/items" 
        end 
    end 

    get '/login' do 
        if logged_in? 
            redirect "/items" 
        else 
            erb :'users/login' 
        end 
    end 

    post '/login' do 
        user = User.find_by(username: params[:username])
        if user
            session[:user_id] = user.id 
            redirect "/items" 
        else 
            redirect "/login"
        end 
    end 

    get '/logout' do 
        if logged_in? 
            session.clear 
            erb :welcome 
        else 
            erb :welcome  
        end 
    end 

end 