require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation tests' do 

    it 'ensures body presense' do 
      comment = Comment.new(is_agent_comment: true, ticket_id: 1).save
      expect(comment).to eq(false)
    end
    

    it 'it should save successfully' do 
      comment = Comment.new(body:'body', is_agent_comment: true, ticket_id: 1).save
      expect(comment).to eq(false)
    end


  end
end
