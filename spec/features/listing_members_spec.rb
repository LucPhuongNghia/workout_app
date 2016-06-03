require 'rails_helper'

RSpec.feature "Listing Members" do
    before do
       @john = User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password') 
       @jo = User.create(first_name: 'Jo', last_name: 'Do', email: 'jo@example.com', password: 'password')
    end
    
    scenario "Show a list of existing members" do
        visit "/"
        
        expect(page).to have_content("List of members")
        expect(page).to have_content(@john.full_name)
        expect(page).to have_content(@jo.full_name)
    end
    
end