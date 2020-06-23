json.data do 
    json.ticket do 
        json.call(
            @ticket,
            :id,
            :ticket_no
        )
    end
end