json.user do 
    json.username @user.username
    json.email @user.email
    json.token @token
    json.id @user.id
    json.is_admin @user.is_admin
end