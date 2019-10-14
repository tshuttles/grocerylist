class ItemsController < ApplicationController 

    get '/items' do 
        if logged_in? 
            @items = current_user.items 
            erb :'/items/index' 
        else 
            redirect '/login' 
        end 
    end 

    get '/items/new' do 
        if logged_in? 
            erb :'/items/new' 
        else 
            redirect '/login' 
        end 
    end 

end 