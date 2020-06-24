require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do 
    it 'ensures name presense' do 
      user = User.new( username: 'username', password:'password', email: 'email@gmail.com', is_admin: true).save
      expect(user).to eq(false)
    end
    it 'ensures username presense' do 
      user = User.new(name: 'name', password:'password', email: 'email@gmail.com', is_admin: false).save
      expect(user).to eq(false)
    end
    it 'ensures email presense' do 
      user = User.new(name: 'name',  username: 'username', password:'password', is_admin: false).save
      expect(user).to eq(false)
    end
    
    it 'ensures password presense' do 
      user = User.new(name: 'name',  username: 'username', email: 'email@gmail.com', is_admin: false).save
      expect(user).to eq(false)
    end

  

    it 'should save successfully' do 
      user = User.new(name: 'name', username: 'username', password:'password', email: 'email1@gmail.com', is_admin: true).save
      expect(user).to eq(true)
    end


  

  end


  context 'scope tests' do 
  end
end
