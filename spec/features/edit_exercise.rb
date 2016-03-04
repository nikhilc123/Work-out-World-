require 'rails_helper'
RSpec.feature "Edit Exercise" do
  before do
    #create dummy user and exercise, and login with that user to update the exercise
    @owner = User.create!(email: "owner@gmail.com", password: "password")
    @owner_exer = @owner.exercises.create(duration_in_min: 20, workout: "Shoulders", workout_date: Date.today)
    login_as(@owner)
  end
  
  scenario "with valid inputs" do
    visit "/"
    click_link "My Lounge"
    #users/1/exercises/4/edit
    link = "a[href='/users/#{@owner.id}/exercises/#{@owner_exer.id}/edit']"
    find(link).click
    fill_in "Duration", with: 50
    click_button "Update Exercise"
    
    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(50)
    expect(page).not_to have_content(45)
  end
end