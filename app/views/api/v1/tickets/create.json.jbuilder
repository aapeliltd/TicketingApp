json.data do 
    json.ticket do 
        json.call(
            @ticket,
            :title,
            :body,
            :ticket_no
        )
    end
end