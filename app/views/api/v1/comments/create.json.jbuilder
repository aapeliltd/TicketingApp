json.data do
    json.comment do
        @user = User.find(@comment.user_id)
        created_status = @user.is_admin ? "Support agent" : "Customer"
        json.id @comment.id
        json.body @comment.body
        json.status created_status
        json.ticket_id @comment.ticket_id
        json.created_at @comment.created_at
        json.created_by @user.name
    end
end