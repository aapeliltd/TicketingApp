require 'rails_helper'

RSpec.describe Survey, type: :model do
  context 'validation tests' do 
    it 'ensures rating presense' do 
      survey = Survey.new(comment: 'comment', ticket_id:1).save
      expect(survey).to eq(false)
    end
    
    it 'ensures comment presense' do 
      survey = Survey.new(rating: 5, ticket_id:1).save
      expect(survey).to eq(false)
    end

    it 'it should save successfully' do 
      survey = Survey.new(rating: 5, comment: 'comment', ticket_id:1).save
      expect(survey).to eq(true)
    end
  end
end
