json.data do
    json.ticket do 
        json.call(
            @ticket,
            :id,
            :title,
            :body,
            :ticket_no,
            :is_close,
            :created_at
        )
    end
    json.user do 
        json.name = @user.name
        json.username = @user.username
        json.email = @user.email
    end

    json.comments do 
        json.array! @comments do |comment|
           @user = User.find(comment.user_id)
           created_status = @user.is_admin ? "Support agent" : "Customer"
           json.id comment.id 
           json.body comment.body
           json.created_at comment.created_at
           json.created_by @user.name
           json.status created_status
        end
    end
end