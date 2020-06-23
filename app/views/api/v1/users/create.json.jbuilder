json.data do 
    json.user do 
        json.call(
            @user,
            :name,
            :username,
            :email
        )
    end
end