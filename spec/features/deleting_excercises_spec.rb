require 'rails_helper'

RSpec.feature "Delete excercise" do
    before do
       @owner = User.create(email: 'owner@example.com', password: 'password') 
       @owner_excer = @owner.excercises.create!(duration_in_min: 48, workout: 'Cardio special', workout_date: Date.today)
       login_as(@owner)
    end
    
    scenario do
        visit '/'
        click_link 'My Lounge'
        link = "//a[contains(@href, '/users/#{@owner.id}/excercises/#{@owner_excer.id}') and .//text()='Destroy']"
        find(:xpath, link).click
        
        expect(page).to have_content('Excercise has been deleted')
        
    end

    
    
end