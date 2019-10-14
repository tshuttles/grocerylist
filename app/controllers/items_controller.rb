class ItemsController < ApplicationController 

    get '/items' do 
        if logged_in? 
            @items = current_user.items 
            erb :'/items/index' 
        else 
            redirect "/login" 
        end 
    end 

    get '/items/new' do 
        if logged_in? 
            erb :'/items/new' 
        else 
            redirect "/login" 
        end 
    end 

    post '/items' do 
        if params[:content] == "" 
            redirect "/items/new" 
        else 
            item = Item.create(content: params[:content]) 
            item.user_id = current_user.id 
            item.save
            redirect "/items" 
        end 
    end 
    
    get '/items/:id' do 
        if logged_in? 
            @item = Item.find_by(params[:id]) 
            erb :'/items/show' 
        else 
            redirect "/login" 
        end 
    end 

    get '/items/:id/edit' do 
        if logged_in? 
            @item = Item.find_by_id(params[:id]) 
            if @item.user_id == session[:user_id] 
                erb :'items/edit' 
            else 
                redirect "/items" 
            end
        else 
            redirect "/login" 
        end
    end 

    patch '/items/:id' do 
        @item = Item.find_by_id(params[:id]) 
        if params[:content] == "" 
            redirect "/items/#{@items.id}/edit"
        else 
            @item.content = params[:content] 
            @item.save 
            redirect "/items/#{@item.id}" 
        end 
    end 

    delete '/items/:id' do 
        @item = Item.find_by_id(params[:id]) 
        if @item.user_id == session[:user_id] 
            @item.delete 
            redirect "/items" 
        else 
            redirect "/items/#{@item.id}"
        end 
    end 

end 