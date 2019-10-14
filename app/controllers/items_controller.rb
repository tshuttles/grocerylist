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

    post '/items' do 
        if params[:content] == "" 
            redirect '/items/new' 
        else 
            item = Item.create(content: params[:content]) 
            item.user_id = current_user.id 
            item.save
            redirect '/items' 
        end 
    end 
    
end 