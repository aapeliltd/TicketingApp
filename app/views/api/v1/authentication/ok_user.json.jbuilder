json.data do 
    json.user do 
        json.username @user.username
        json.email @user.email
    end
end