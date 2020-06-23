json.data do
    json.comment do
        json.call(
            @comment,
            :id,
            :body,
            :is_agent_comment,
            :ticket_id,
            :user_id
        )
    end
end