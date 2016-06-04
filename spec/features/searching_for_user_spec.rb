require 'rails_helper'

RSpec.feature "Searching for Users" do
    before do
       @john = User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password') 
       @jo = User.create(first_name: 'Jo', last_name: 'Doe', email: 'jo@example.com', password: 'password')
    end
   
    scenario "With existing name returns all those users" do
       visit '/'
       
       fill_in "search_name", with: "Doe"
       click_button "Search"
       
       expect(page).to have_content(@john.full_name)
       expect(page).to have_content(@jo.full_name)
       expect(current_path).to eq("/dashboard/search")
    end
    
end