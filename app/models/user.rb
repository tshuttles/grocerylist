class User < ActiveRecord::Base 
    has_many :items 
    has_secure_password

    # has_many macro: 
    def item 
        @item 
    end 

    def item=
        @item = item 
    end 

    def add_item(item)
        @item.user_id = self.id  
    end 

end 