json.data do 
    json.user do
        json.id  @user.id
        json.name @user.name
        json.username @user.username
        json.email @user.email 
    end
    json.tickets do 
        json.array! @tickets do |ticket|
            json.id ticket.id 
            json.title ticket.title
            json.body ticket.body
            json.is_close ticket.is_close
            json.created_at ticket.created_at
            json.ticket_no ticket.ticket_no
            json.comments do 
                json.array! ticket.comments do |comment|
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
    end
end