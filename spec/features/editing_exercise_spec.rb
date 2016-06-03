require 'rails_helper'

RSpec.feature "Editing Excercise" do
    before do
       @owner = User.create(email: 'owner@example.com', password: 'password')
       @owner_exer = @owner.excercises.create!(duration_in_min: 45, workout: 'Cardio Activity', workout_date: Date.today)
       login_as(@owner)
    end
    
    scenario "With valid input succeeds" do
        visit '/'
        click_link 'My Lounge'
        link = "a[href='/users/#{@owner.id}/exercises/#{@owner_excer.id}/edit']"
        find(link).click
        
        fill_in "Duration", with: 50
        click_button 'Update Excercise'
        
        expect(page).to have_content("Excercise has been updated")
        expect(page).to have_content(50)
        expect(page).not_to have_content(45)
    end
    
end