require 'rails_helper'
RSpec.feature "Delete an Exercise" do
  before do
    @owner = User.create!(first_name: "Owner", last_name: "Tengratool", email: "owner@gmail.com", password: "password")
    @owner_exer = @owner.exercises.create(duration_in_min: 20, workout: "Shoulders", workout_date: Date.today)
    
    login_as(@owner)
  end
  
  scenario do
    visit "/"
    click_link "My Lounge"
    
    link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_exer.id}/') and .//text()='Destroy']"
    find(:xpath, link).click
    
    expect(page).to have_content("Exercise has been deleted")
  end
end