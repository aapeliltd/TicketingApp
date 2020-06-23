json.data do 
    json.survey do 
        json.call(
            @survey,
            :id,
            :rating,
            :comment,
            :ticket_id,
            :created_at
        )
    end
end