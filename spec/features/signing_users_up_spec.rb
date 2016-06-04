require 'rails_helper'

RSpec.feature "User sign up" do
    
    scenario "With credential valid" do
       visit '/'
       
       click_link "Sign up"
       fill_in "First name", with: "John"
       fill_in "Last name", with: "Doe"
       fill_in "Email", with: "user@example.com"
       fill_in "Password", with: "password"
       fill_in "Password confirmation", with: "password"
       click_button "Sign up"

       
       expect(page).to have_content('You have signed up successfully')
       visit '/'
       expect(page).to have_content("John Doe")
    end
    
    scenario "With credential invalid" do
       visit '/'
       
       click_link "Sign up"
       fill_in "First name", with: ""
       fill_in "Last name", with: ""
       fill_in "Email", with: "user@example.com"
       fill_in "Password", with: "password"
       fill_in "Password confirmation", with: "password"
       click_button "Sign up"

       
       expect(page).to have_content("First name can't be blank")
       expect(page).to have_content("Last name can't be blank")
       
    end
    
end