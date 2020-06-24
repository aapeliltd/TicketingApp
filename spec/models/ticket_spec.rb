require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'validation tests' do 
    it 'ensures title presense' do 
      ticket = Ticket.new(body: 'body', user_id:1, ticket_no: '1234RGD', is_close: true).save
      expect(ticket).to eq(false)
    end
    
    it 'ensures body presense' do 
      ticket = Ticket.new(title: 'title', user_id:1, ticket_no: '1234RGD', is_close: true).save
      expect(ticket).to eq(false)
    end

    it 'it should save successfully' do 
      ticket = Ticket.new(title: 'title', body: 'body', user_id:1, ticket_no: '1234RGD', is_close: true).save
      expect(ticket).to eq(true)
    end
  end
end
