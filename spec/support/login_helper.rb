module LoginHelper
    def login(user)
        request.session[:user_id] = user.id
    end

    def logout
        request.session[:user_id] = nil 
    end
end
