require 'rails_helper'
RSpec.feature "Create a exercise with valid credentials" do
  before do
    @nik = User.create!(first_name: "nikhil", last_name: "Chikorde", email: "nik@gmail.com", password: "password")
  end
  
  scenario do
    login_as(@nik)
    visit "/"
    click_link "My Lounge"
    click_link "New Workout"
    
    fill_in "Duration", with: 70
    fill_in "Workout Details", with: "Chest and Biceps"
    fill_in "Activity Date", with: Date.today
    
    click_button "Create Exercise"
    
    expect(page).to have_content("Exercise has been created")
    
    exercise = Exercise.last
    expect(page.current_path).to eq(user_exercise_path(@nik, exercise))
  end
  
  scenario "with invalid inputs" do
    login_as(@nik)
    visit "/"
    click_link "My Lounge"
    click_link "New Workout"
    
    expect(page).to have_content("Back")
    
    fill_in "Duration", with: nil
    fill_in "Workout Details", with: ""
    fill_in "Activity Date", with: ""
    
    click_button "Create Exercise"
    
    expect(page).to have_content("Exercise has not been created")
    expect(page).to have_content("Duration in min can't be blank")
    expect(page).to have_content("Duration in min is not a number")
    expect(page).to have_content("Workout Details can't be blank")
    expect(page).to have_content("Activity Date can't be blank")
  end
end