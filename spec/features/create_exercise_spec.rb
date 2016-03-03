require 'rails_helper'
RSpec.feature "Create a exercise with valid credentials" do
  before do
    @nik = User.create!(email: "nik@gmail.com", password: "password")
  end
  
  scenario do
    login_as(@nik)
    visit "/"
    click_link "My Lounge"
    click_link "New Workout"
    
    fill_in "Duration", with: 70
    fill_in "Workout Details", with: "Chest and Biceps"
    fill_in "Activity Date", with: "2016-03-03"
    
    click_button "Create Exercise"
    
    expect(page).to have_content("Exercise has been created")
    
    exercise = Exercise.last
    expect(page.current_path).to eq(user_exercise_path(@nik, exercise))
  end
end